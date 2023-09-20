import 'package:flutter/material.dart';
import 'package:rick_n_morty_status_component/src/common/ext_library.dart';

class CharacterDialog extends StatelessWidget {
  const CharacterDialog({
    super.key,
    required this.trailingTitleWidget,
    required this.icon,
    required this.content,
    this.actions,
  });

  final Widget trailingTitleWidget;
  final Widget icon;
  final Widget content;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: WillPopScope(
          onWillPop: () async => false,
          child: Align(
            alignment: Alignment.center,
            child: Material(
              elevation: 24,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              type: MaterialType.card,
              clipBehavior: Clip.none,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: trailingTitleWidget.let(
                            (widget) => Padding(
                              padding: const EdgeInsets.only(
                                left: 32,
                                bottom: 16,
                              ),
                              child: widget,
                            ),
                          )),
                      icon,
                      content.let(
                        (content) => Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Center(child: content),
                        ),
                      ),
                      ...actions?.compactMap(
                            (actionButton) => Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 16,
                                  right: 16,
                                ),
                                child: actionButton,
                              ),
                            ),
                          ) ??
                          const [],
                    ].compactMap((e) => e),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
