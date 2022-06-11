import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainButton extends HookConsumerWidget {
  const MainButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tapped = useState(false);
    return GestureDetector(
      onTap: () {
        tapped.value = true;
        Timer(const Duration(seconds: 1), (){
          tapped.value = false;
        });
      },
      child: AnimatedContainer(
        height: 50,
        width: tapped.value ? 50 : 120,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(5),
        duration: const Duration(milliseconds: 300),
        child: tapped.value
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
      ),
    );
  }
}
