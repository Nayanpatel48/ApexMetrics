// lib/web_integrations.dart

import 'dart:html' as html;

void injectVoiceflowScript(String projectID) {
  final script = html.ScriptElement();
  script.type = 'text/javascript';

  // This is the full JavaScript snippet from Voiceflow
  script.innerHtml = '''
    (function(d, t) {
        var v = d.createElement(t), s = d.getElementsByTagName(t)[0];
        v.onload = function() {
          window.voiceflow.chat.load({
            verify: { projectID: '$projectID' },
            url: 'https://general-runtime.voiceflow.com',
            versionID: 'production',
            voice: {
              url: "https://runtime-api.voiceflow.com"
          }
          });
        }
        v.src = "https://cdn.voiceflow.com/widget-next/bundle.mjs"; v.type = "text/javascript"; s.parentNode.insertBefore(v, s);
    })(document, 'script');
  ''';
  // Add the script to the body of the HTML document
  html.document.body?.append(script);
}
