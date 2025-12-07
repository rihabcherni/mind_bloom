import 'package:flutter/material.dart';
import 'package:frontend/constants/app_constants.dart';

Widget buildFormattedText(String text, bool isDark, bool isUser) {
  final elements = parseMarkdown(text);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: elements.map((element) {
      switch (element.type) {
        case MarkdownType.heading1:
          return Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4),
            child: Text(
              element.content,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: isUser
                    ? (isDark ? Colors.white : Colors.black87)
                    : Colors.white,
              ),
            ),
          );

        case MarkdownType.heading2:
          return Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4),
            child: Text(
              element.content,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isUser
                    ? (isDark ? Colors.white : Colors.black87)
                    : Colors.white,
              ),
            ),
          );

        case MarkdownType.heading3:
          return Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4),
            child: Text(
              element.content,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isUser
                    ? (isDark ? Colors.white : Colors.black87)
                    : Colors.white,
              ),
            ),
          );

        case MarkdownType.listItem:
          return Padding(
            padding: const EdgeInsets.only(left: 10, top: 4, bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '• ',
                  style: TextStyle(
                    fontSize: 15,
                    color: isUser
                        ? (isDark ? Colors.white : Colors.black87)
                        : Colors.white,
                  ),
                ),
                Expanded(child: buildRichText(element.content, isDark, isUser)),
              ],
            ),
          );

        case MarkdownType.numberedItem:
          return Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${element.number}. ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: isUser
                        ? (isDark ? Colors.white : Colors.black87)
                        : Colors.white,
                  ),
                ),
                Expanded(child: buildRichText(element.content, isDark, isUser)),
              ],
            ),
          );

        case MarkdownType.codeBlock:
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isUser
                  ? (isDark ? const Color(0xFF1A1A2E) : Colors.grey[200])
                  : Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isUser
                    ? (isDark ? Colors.white24 : Colors.grey[400]!)
                    : Colors.white24,
              ),
            ),
            child: Text(
              element.content,
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 14,
                color: isUser
                    ? (isDark ? Colors.white : Colors.black87)
                    : Colors.white,
              ),
            ),
          );

        case MarkdownType.divider:
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Divider(
              color: isDark ? Colors.white24 : Colors.grey[400],
              thickness: 1,
            ),
          );

        case MarkdownType.blockquote:
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF8B5FBF).withOpacity(0.1)
                  : const Color(0xFF8B5FBF).withOpacity(0.05),
              borderRadius: BorderRadius.circular(8),
              border: Border(
                left: BorderSide(color: const Color(0xFF8B5FBF), width: 4),
              ),
            ),
            child: buildRichText(element.content, isDark, isUser),
          );

        case MarkdownType.paragraph:
        default:
          return Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4),
            child: buildRichText(element.content, isDark, isUser),
          );
      }
    }).toList(),
  );
}

Widget buildRichText(String text, bool isDark, bool isUser) {
  final spans = <InlineSpan>[];
  final regex = RegExp(
    r'\*\*(.+?)\*\*|'
    r'\*(.+?)\*|'
    r'`(.+?)`|'
    r'__(.+?)__|'
    r'_(.+?)_',
  );

  int lastIndex = 0;

  for (final match in regex.allMatches(text)) {
    if (match.start > lastIndex) {
      spans.add(
        TextSpan(
          text: text.substring(lastIndex, match.start),
          style: TextStyle(
            color: isUser
                ? (isDark ? Colors.white : Colors.black87)
                : Colors.white,
            fontSize: 15,
            height: 1.5,
          ),
        ),
      );
    }
    if (match.group(1) != null || match.group(4) != null) {
      spans.add(
        TextSpan(
          text: match.group(1) ?? match.group(4),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isUser
                ? (isDark ? Colors.white : Colors.black87)
                : const Color.fromARGB(255, 229, 215, 215),
            fontSize: 15,
            height: 1.5,
          ),
        ),
      );
    } else if (match.group(2) != null || match.group(5) != null) {
      spans.add(
        TextSpan(
          text: match.group(2) ?? match.group(5),
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: isUser
                ? (isDark ? Colors.white : Colors.black87)
                : Colors.white,
            fontSize: 15,
            height: 1.5,
          ),
        ),
      );
    } else if (match.group(3) != null) {
      spans.add(
        WidgetSpan(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            decoration: BoxDecoration(
              color: isUser
                  ? (isDark ? const Color(0xFF1A1A2E) : Colors.grey[300])
                  : Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              match.group(3)!,
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 14,
                color: isUser
                    ? (isDark ? Colors.white : Colors.black87)
                    : Colors.white,
              ),
            ),
          ),
        ),
      );
    }

    lastIndex = match.end;
  }
  if (lastIndex < text.length) {
    spans.add(
      TextSpan(
        text: text.substring(lastIndex),
        style: TextStyle(
          color: isUser
              ? (isDark ? Colors.white : AppConstants.darkViolet)
              : Colors.white,
          fontSize: 15,
          height: 1.5,
        ),
      ),
    );
  }

  return RichText(text: TextSpan(children: spans));
}

List<MarkdownElement> parseMarkdown(String text) {
  final elements = <MarkdownElement>[];
  final lines = text.split('\n');

  bool inCodeBlock = false;
  String codeBlockContent = '';
  int numberedListCounter = 0;

  for (int i = 0; i < lines.length; i++) {
    String line = lines[i];
    if (line.trim().startsWith('```')) {
      if (inCodeBlock) {
        elements.add(
          MarkdownElement(
            type: MarkdownType.codeBlock,
            content: codeBlockContent.trim(),
          ),
        );
        codeBlockContent = '';
        inCodeBlock = false;
      } else {
        inCodeBlock = true;
      }
      continue;
    }

    if (inCodeBlock) {
      codeBlockContent += line + '\n';
      continue;
    }
    if (line.trim().isEmpty) {
      numberedListCounter = 0;
      continue;
    }
    if (RegExp(r'^-{3,}$').hasMatch(line.trim())) {
      elements.add(MarkdownElement(type: MarkdownType.divider, content: ''));
      continue;
    }
    final headingMatch = RegExp(r'^(#{1,4})\s+(.+)$').firstMatch(line);
    if (headingMatch != null) {
      final level = headingMatch.group(1)!.length;
      final content = headingMatch.group(2)!.trim();
      elements.add(
        MarkdownElement(
          type: level == 1
              ? MarkdownType.heading1
              : level == 2
              ? MarkdownType.heading2
              : MarkdownType.heading3,
          content: content,
        ),
      );
      numberedListCounter = 0;
      continue;
    }
    final quoteMatch = RegExp(r'^>\s+(.+)$').firstMatch(line);
    if (quoteMatch != null) {
      elements.add(
        MarkdownElement(
          type: MarkdownType.blockquote,
          content: quoteMatch.group(1)!.trim(),
        ),
      );
      numberedListCounter = 0;
      continue;
    }
    final numberedMatch = RegExp(r'^\d+\.\s+(.+)$').firstMatch(line);
    if (numberedMatch != null) {
      numberedListCounter++;
      elements.add(
        MarkdownElement(
          type: MarkdownType.numberedItem,
          content: numberedMatch.group(1)!.trim(),
          number: numberedListCounter,
        ),
      );
      continue;
    }
    final listMatch = RegExp(r'^[-*•]\s+(.+)$').firstMatch(line);
    if (listMatch != null) {
      elements.add(
        MarkdownElement(
          type: MarkdownType.listItem,
          content: listMatch.group(1)!.trim(),
        ),
      );
      numberedListCounter = 0;
      continue;
    }
    if (line.trim().isNotEmpty) {
      elements.add(
        MarkdownElement(type: MarkdownType.paragraph, content: line.trim()),
      );
      numberedListCounter = 0;
    }
  }

  return elements;
}

enum MarkdownType {
  heading1,
  heading2,
  heading3,
  paragraph,
  listItem,
  numberedItem,
  codeBlock,
  divider,
  blockquote,
}

class MarkdownElement {
  final MarkdownType type;
  final String content;
  final int number;

  MarkdownElement({required this.type, required this.content, this.number = 0});
}
