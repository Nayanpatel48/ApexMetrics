import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VoiceflowChatWidget extends StatefulWidget {
  const VoiceflowChatWidget({super.key});

  @override
  State<VoiceflowChatWidget> createState() => _VoiceflowChatWidgetState();
}

class _VoiceflowChatWidgetState extends State<VoiceflowChatWidget> {
  late final WebViewController _controller;

  // Replace with your actual Voiceflow Project ID
  final String _voiceflowProjectID = '68afff1a1a3ce574940e9d9c';

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      // Set a transparent background to make it look like a floating widget
      ..setBackgroundColor(const Color(0x00000000))
      ..loadHtmlString(_buildHtml(_voiceflowProjectID));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }

  // This function builds the full HTML document as a string
  String _buildHtml(String projectID) {
    return '''
      <!DOCTYPE html>
      <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
          /* Make the body transparent */
          body { 
            background-color: transparent; 
            margin: 0;
            padding: 0;
          }
        </style>
      </head>
      <body>
        <script type="text/javascript">
          (function(d, t) {
              var v = d.createElement(t), s = d.getElementsByTagName(t)[0];
              v.onload = function() {
                window.voiceflow.chat.load({
                  verify: { projectID: '$projectID' },
                  url: 'https://general-runtime.voiceflow.com',
                  versionID: 'production'
                });
              }
              v.src = "https://cdn.voiceflow.com/widget-next/bundle.mjs"; v.type = "text/javascript"; s.parentNode.insertBefore(v, s);
          })(document, 'script');
        </script>
      </body>
      </html>
    ''';
  }
}
