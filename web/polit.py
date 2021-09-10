#!/usr/bin/env python3

import sys, os, requests
import vk_api, json, time, datetime
import math

login = 'telephone number'
password = 'password'

class Robot:
    def __init__(self, log: str, pas: str):
        self.__session = requests.Session()
        self.vk = vk_api.VkApi(log, pas)
        self.vk.auth()
    def method(self, method, param):
        return self.vk.method(method, param)
    def whois(self, uid, fields=''):
        return self.vk.method(
            'users.get',
            {
                'user_ids': ", ".join([str(u) for u in uid]), #uid
                'fields': fields
            }
        )
    def friends(self, uid, fields=''):
        return self.vk.method(
            'friends.get',
            {
                'user_id': uid,
                'fields': fields
            }
        )
r = Robot(login, password)

def get_group(group_id, print_main=False):
    if print_main:
        print("==", r.method('groups.getById', {
            'group_ids': group_id
        })[0]["name"], "-->")
    info = []
    members_cnt = r.method('groups.getMembers', {
        'group_id': group_id,
        'v': '5.126'
    })["count"]
    for seg in range(math.ceil(members_cnt / 1000)):
        beg = seg * 1000
        end = min((seg + 1) * 1000, members_cnt)
        members = r.method('groups.getMembers', {
            'group_id': group_id,
            'sort': 'id_asc',
            'offset': beg,
            'v': '5.126'
        })["items"]
        info += r.whois(members, 'personal')

        pr = int(1000 * beg / members_cnt) / 10
        print("\r", beg, " -> ", end - 1, " [", pr, "%]", sep="", end=" " * 32)
    print("\r" + " " * 64 + "\r", end="")
    return info

def get_friends(uid, print_main=False):
    user_info = r.whois([uid])[0]
    print("==", user_info["last_name"], user_info["first_name"], "-->")
    return r.friends(int(uid), 'personal')["items"]

polit = {
    1: "Communist",
    2: "Socialist",
    3: "Moderate",
    4: "Liberal", 
    5: "Conservative", 
    6: "Monarchist",
    7: "Ultraconservative",
    8: "Apathetic",
    9: "Libertarian"
}

parties = {}

HELP_MSG = """
    friend - взгляды друзей
    group - взгляды в группе
    синтаксис group и friend: polit <group|friend> <vk ID/nickname> <печатать имена n|y> <печатать имя группы/человека n|y>
    """
print_people = False

try:
    cmd = sys.argv[1]
    vk_id = sys.argv[2]
    print_people = sys.argv[3].lower() == 'y'
    print_main = sys.argv[4].lower() == 'y'
except:
    exit(HELP_MSG)


if cmd == "friend":
    info = get_friends(vk_id, print_main)
elif cmd == "group":
    info = get_group(vk_id, print_main)
else: 
    exit("Wrong command")


for pol_views_id, ideology in polit.items():
    parties[ideology] = []
for human in info:
    if not human.get("personal"):
        continue
    pol_views_id = human["personal"].get("political")
    if pol_views_id:
        if 0 <= pol_views_id <= 9:
            parties[polit[pol_views_id]] += [human]

for ideology, party in sorted(parties.items()):
    if len(party) == 0:
        continue
    print(ideology, "s [", len(party), "]", sep="", end="")
    if print_people:
        print(": ", end="")
        for human in party:
            print(human["last_name"] + " " + human["first_name"] + ", ", end="")
        print()
    print()

