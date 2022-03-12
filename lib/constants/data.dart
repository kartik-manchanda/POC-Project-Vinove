import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List Calls = [
  {
    "title": "Aditya",
    "subtitle": "28 Feburary, 2:20 PM",
    "image": "assets/images/img_avatar.png",
    "trailing": "13:10"
  },
  {
    "title": "Kartik",
    "subtitle": "20 Feburary, 1:20 AM",
    "image": "assets/images/img_avatar.png",
    "trailing": "13:10"
  },
  {
    "title": "Prashant",
    "subtitle": "10 Feburary, 4:20 AM",
    "image": "assets/images/img_avatar.png",
    "trailing": "13:10"
  },
  {
    "title": "Adarsh",
    "subtitle": "15 Feburary, 5:20 AM",
    "image": "assets/images/img_avatar.png",
    "trailing": "13:10"
  },
];

List whatsapp = [
  {
    "title": "Aditya",
    "subtitle": "Hello Bhai",
    "image": "assets/images/img_avatar.png",
    "trailing": "11:06 AM"
  },
  {
    "title": "Kartik",
    "subtitle": "Hello",
    "image": "assets/images/img_avatar.png",
    "trailing": "2:20 PM"
  },
  {
    "title": "Prashant",
    "subtitle": "Mai kaam nahi karunga",
    "image": "assets/images/img_avatar.png",
    "trailing": "10:30 AM"
  },
  {
    "title": "Adarsh",
    "subtitle": "Mai Office hi nahi aaunga",
    "image": "assets/images/img_avatar.png",
    "trailing": "5:40 PM"
  },
  {
    "title": "Ananya",
    "subtitle": "Hello",
    "image": "assets/images/img_avatar.png",
    "trailing": "6:30 PM"
  },
];

const chatdata = [
  {
    "me": false,
    "text": "hello",
    "time": "00:00"
  },
  {
    "me": true,
    "text": "hi",
    "time": "00:00"
  },
  {
    "me": false,
    "text": "hello",
    "time": "00:00"
  },
  {
    "me": true,
    "text": "hi",
    "time": "00:00"
  },
  {
    "me": false,
    "text": "hello",
    "time": "00:00"
  },
  {
    "me": true,
    "text": "hi",
    "time": "00:00"
  },
  {
    "isMe": false,
    "text": "hello",
    "time": "00:00"
  },
  {
    "isMe": true,
    "text": "hi",
    "time": "00:00"
  },
  {
    "isMe": false,
    "text": "hello",
    "time": "00:00"
  },
  {
    "isMe": true,
    "text": "hi",
    "time": "00:00"
  },
  {
    "isMe": false,
    "text": "hello",
    "time": "00:00"
  },
  {
    "isMe": true,
    "text": "hi",
    "time": "00:00"
  },
  {
    "me": false,
    "text": "hello",
    "time": "00:00"
  },
  {
    "me": true,
    "text": "hi",
    "time": "00:00"
  },
  {
    "me": false,
    "text": "hello",
    "time": "00:00"
  },
  {
    "me": true,
    "text": "hi",
    "time": "00:00"
  },
  {
    "me": false,
    "text": "hello",
    "time": "00:00"
  },
  {
    "me": true,
    "text": "hi",
    "time": "00:00"
  },
  {
    "isMe": false,
    "text": "hello",
    "time": "00:00"
  },
  {
    "isMe": true,
    "text": "hi",
    "time": "00:00"
  },
  {
    "isMe": false,
    "text": "hello",
    "time": "00:00"
  },
  {
    "isMe": true,
    "text": "hi",
    "time": "00:00"
  },
  {
    "isMe": false,
    "text": "hello",
    "time": "00:00"
  },
  {
    "isMe": true,
    "text": "hi",
    "time": "00:00"
  },
];


const data = [
  {
    'name': 'Aditya',
    'message': 'bhai....',
    'time': '10:00',
    'profilePic':
    'https://i.pinimg.com/564x/c2/e0/13/c2e0139619f88f43ee7206e7a08f65a2.jpg',
  },
  {
    'name': 'Kartik',
    'message': 'Hey, how are you doing?',
    'time': '14:00',
    'profilePic':
    'https://i.pinimg.com/564x/9b/6b/df/9b6bdf5392b5712b19c947d04797e3db.jpg',
  },
  {
    'name': 'Sagar Sir',
    'message': 'any update ?!',
    'time': '17:30',
    'profilePic':
    'https://i.pinimg.com/564x/1e/f6/07/1ef607230cecfa4ea6ee3757befa6f9d.jpg',
  },
];

List settings = [
  {
    "title": "Account",
    "subtitle": "Privacy, Security, Change Number",
    "image":  Icon(Icons.vpn_key),
    "onTap" : "Scratch()",

  },
  {
    "title": "Chats",
    "subtitle": "Theme, wallpapers, chat history",
     "image":   Icon(Icons.chat_sharp)

  },
  {
    "title": "Notifications",
    "subtitle": "Message, group and call tone",
    "image":  Icon(Icons.notifications)

  },
  {
    "title": "Storage and data",
    "subtitle": "Network usage, auto download",
     "image":  Icon(Icons.settings_backup_restore_rounded)

  },
  {
    "title": "Help",
    "subtitle": "Help Center, contact us, privacy policy ",
    "image":  Icon(Icons.help)

  },
  {
    "title": "Invite A Friend",
    "subtitle": "",
    "image":  Icon(Icons.group)

  },
];

List accountpage = [
  {
    "title": "Privacy",
    //"subtitle": "Privacy, Security, Change Number",
    "image":  Icon(Icons.lock)

  },
  {
    "title": "Security",
    //"subtitle": "Theme, wallpapers, chat history",
    "image":   Icon(Icons.security)

  },
  {
    "title": "Two-step Verification",
    //"subtitle": "Message, group and call tone",
    "image":  Icon(Icons.domain_verification)

  },
  {
    "title": "Change Number",
    //"subtitle": "Network usage, auto download",
    "image":  Icon(Icons.phonelink_ring_outlined)

  },
  {
    "title": "Request Account Info",
    //"subtitle": "Help Center, contact us, privacy policy ",
    "image":  Icon(Icons.request_quote_rounded)

  },
  {
    "title": "Delete My Account",
    //"subtitle": "",
    "image":  Icon(Icons.delete)

  },


];
