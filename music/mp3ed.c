#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>

typedef struct musicFile {
    char *author,
         *album,
         *year,
         *name;
} musicFile;

void usage() {
    printf("mp3ed [mp3 file] [-n song name] [-a author/group] [-al album] [-y year] [-h]\n\n");
}

static int file_size(const char *name) {
    struct stat f;
    stat(name, &f);
    return f.st_size;
}

const char *signatures[] = {
    "TPE1", /* name */
    "TALB", /* authors */
    "TYER", /* album */
            /* year */
};

void set_chg(char *buf, musicFile info) {
    char *name = malloc(strlen(info.name) + 100);
    char *author = malloc(strlen(info.author) + 100);
    char *album = malloc(strlen(info.album) + 100);
    strcpy(name, info.name); 
    strcpy(author, info.author);
    strcpy(album, info.album);
    strcat(name, signatures[0]);
    strcat(author, signatures[1]);
    strcat(album, signatures[2]);

    int off = 0x7;
    memcpy(off + buf + 0xE, name, strlen(name));
    off += strlen(name) + 0x7;
    memcpy(off + buf, author, strlen(author));
    off += strlen(author) + 0x7;
    memcpy(off + buf, album, strlen(album));
    off += strlen(album) + 0x7;
    memcpy(off + buf, info.year, strlen(info.year));
    
    printf("%s %s %s\n", name, author, album);
    
    free(name); free(author); free(album);
}

int modify(const char *fname, musicFile info) {
    FILE *f = fopen(fname, "rb");
    if (!f) return 1;
    size_t size = file_size(fname);
    char *contents = malloc(size + 1024);
    fread(contents, size, 1, f);
    fclose(f);

    set_chg(contents, info);

    f = fopen(fname, "wb");
    fwrite(contents, size, 1, f);    
    fclose(f);
    free(contents);
    return 0;
}

int main(int argc, char *argv[]) {
    int i;
    musicFile info;
    const char *fname = NULL;
    memset(&info, 0, sizeof(info));
    for (i = 1; i < argc; i++) {
        if (!strcmp(argv[i], "-h")) {
            usage();
            return 0;
        } else
        if (!strcmp(argv[i], "-n")) {
            i++;
            if (i < argc)
                info.name = argv[i];
        } else
        if (!strcmp(argv[i], "-a")) {
            i++;
            if (i < argc)
                info.author = argv[i];
        } else
        if (!strcmp(argv[i], "-al")) {
            i++;
            if (i < argc)
                info.album = argv[i];
        } else
        if (!strcmp(argv[i], "-y")) {
            i++;
            if (i < argc)
                info.year = argv[i];
        } else
            fname = argv[i];
    }
    if (fname == NULL) {
        printf("No explicit file name.\n");
        return 1;
    }
    if (info.name == NULL) info.name = "";
    if (info.author == NULL) info.author = "";
    if (info.album == NULL) info.album = "";
    if (info.year == NULL) info.year = "";
    if (modify(fname, info)) 
        printf("Error\n");
    return 0;
}
