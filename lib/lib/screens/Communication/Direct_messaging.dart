import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ---------- MODEL ----------
class ChatUser {
  final String id;
  final String name;
  final String avatarUrl;
  final String lastMessage;
  final DateTime lastMessageTime;
  final bool isOnline;

  ChatUser({
    required this.id,
    required this.name,
    this.avatarUrl = '',
    required this.lastMessage,
    required this.lastMessageTime,
    this.isOnline = false,
  });
}

class ChatMessage {
  final String id;
  final String senderId;
  final String text;
  final DateTime timestamp;
  final bool isRead;

  ChatMessage({
    required this.id,
    required this.senderId,
    required this.text,
    required this.timestamp,
    this.isRead = false,
  });
}

// ---------- MAIN SCREEN ----------
class DirectMessagingScreen extends StatefulWidget {
  @override
  _DirectMessagingScreenState createState() => _DirectMessagingScreenState();
}

class _DirectMessagingScreenState extends State<DirectMessagingScreen> {
  // Dummy data – replace with Firebase/API later
  List<ChatUser> _contacts = [];

  @override
  void initState() {
    super.initState();
    _loadDummyData();
  }

  void _loadDummyData() {
    _contacts = [
      ChatUser(
        id: 'u1',
        name: 'Teacher Alice',
        lastMessage: 'Check the homework for tomorrow.',
        lastMessageTime: DateTime.now().subtract(Duration(minutes: 5)),
        isOnline: true,
      ),
      ChatUser(
        id: 'u2',
        name: 'Parent Peter',
        lastMessage: 'Okay, noted. I will attend.',
        lastMessageTime: DateTime.now().subtract(Duration(hours: 2)),
        isOnline: false,
      ),
      ChatUser(
        id: 'u3',
        name: 'Principal Mugisha',
        lastMessage: 'Meeting rescheduled to 10 AM.',
        lastMessageTime: DateTime.now().subtract(Duration(days: 1)),
        isOnline: true,
      ),
      ChatUser(
        id: 'u4',
        name: 'Student Grace',
        lastMessage: 'Can you explain the formula again?',
        lastMessageTime: DateTime.now().subtract(Duration(days: 2)),
        isOnline: false,
      ),
    ];
  }

  void _openChat(ChatUser user) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatDetailScreen(contact: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Search contacts coming soon!')),
              );
            },
          ),
        ],
      ),
      body: _contacts.isEmpty
          ? Center(child: Text('No messages yet.'))
          : ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                final user = _contacts[index];
                return _buildContactTile(user);
              },
            ),
    );
  }

  Widget _buildContactTile(ChatUser user) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundColor: Colors.green[100],
            child: Text(
              user.name.isNotEmpty ? user.name[0].toUpperCase() : '?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green[800]),
            ),
          ),
          if (user.isOnline)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
        ],
      ),
      title: Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        user.lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.grey[600]),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _formatTime(user.lastMessageTime),
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
          ),
          SizedBox(height: 4),
          // Unread indicator (dummy – just show a dot for now)
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
      onTap: () => _openChat(user),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    if (now.difference(time).inDays == 0) {
      return DateFormat('HH:mm').format(time);
    } else if (now.difference(time).inDays == 1) {
      return 'Yesterday';
    } else {
      return DateFormat('dd/MM').format(time);
    }
  }
}

// ---------- CHAT DETAIL SCREEN ----------
class ChatDetailScreen extends StatefulWidget {
  final ChatUser contact;

  const ChatDetailScreen({Key? key, required this.contact}) : super(key: key);

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadDummyMessages();
  }

  void _loadDummyMessages() {
    // Dummy conversation
    _messages.addAll([
      ChatMessage(
        id: 'm1',
        senderId: 'u1',
        text: 'Hello! How can I help you today?',
        timestamp: DateTime.now().subtract(Duration(hours: 3)),
        isRead: true,
      ),
      ChatMessage(
        id: 'm2',
        senderId: 'me',
        text: 'I have a question about the assignment.',
        timestamp: DateTime.now().subtract(Duration(hours: 2, minutes: 45)),
        isRead: true,
      ),
      ChatMessage(
        id: 'm3',
        senderId: 'u1',
        text: 'Sure, what do you need?',
        timestamp: DateTime.now().subtract(Duration(hours: 2, minutes: 30)),
        isRead: true,
      ),
      ChatMessage(
        id: 'm4',
        senderId: 'me',
        text: 'Can you explain question 5 again?',
        timestamp: DateTime.now().subtract(Duration(minutes: 10)),
        isRead: false,
      ),
    ]);
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(
        ChatMessage(
          id: 'm${_messages.length + 1}',
          senderId: 'me',
          text: text,
          timestamp: DateTime.now(),
          isRead: false,
        ),
      );
      _messageController.clear();
    });

    // Scroll to bottom after rebuilding
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });

    // Simulate auto-reply (for demo)
    _simulateAutoReply();
  }

  void _simulateAutoReply() {
    // Delay to simulate "typing"
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _messages.add(
          ChatMessage(
            id: 'm${_messages.length + 1}',
            senderId: widget.contact.id,
            text: 'Thanks! I will get back to you shortly.',
            timestamp: DateTime.now(),
            isRead: true,
          ),
        );
      });
      // Auto-scroll again
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.green[100],
              child: Text(
                widget.contact.name[0].toUpperCase(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green[800]),
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.contact.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  widget.contact.isOnline ? 'Online' : 'Last seen recently',
                  style: TextStyle(fontSize: 12, color: widget.contact.isOnline ? Colors.green : Colors.grey[500]),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // TODO: Show options (clear chat, block, etc.)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('More options coming soon!')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isMe = msg.senderId == 'me';
                return _buildMessageBubble(msg, isMe);
              },
            ),
          ),
          // Input bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border(top: BorderSide(color: Colors.grey[300]!)),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.attach_file, color: Colors.grey[600]),
                  onPressed: () {
                    // TODO: Implement file/image picker
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('File attachment coming soon!')),
                    );
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  child: IconButton(
                    icon: Icon(Icons.send, color: Colors.white, size: 20),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage msg, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: isMe ? Colors.green[300] : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(isMe ? 16 : 4),
            bottomRight: Radius.circular(isMe ? 4 : 16),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              msg.text,
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black87,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  DateFormat('HH:mm').format(msg.timestamp),
                  style: TextStyle(
                    fontSize: 10,
                    color: isMe ? Colors.white70 : Colors.grey[600],
                  ),
                ),
                if (isMe) ...[
                  SizedBox(width: 4),
                  Icon(
                    msg.isRead ? Icons.done_all : Icons.done,
                    size: 16,
                    color: msg.isRead ? Colors.white : Colors.white70,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}