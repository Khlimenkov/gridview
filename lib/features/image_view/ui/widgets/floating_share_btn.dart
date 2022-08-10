import 'package:flutter/material.dart';

class FloatingWithLoadingBtn extends StatefulWidget {
  const FloatingWithLoadingBtn({Key? key, required this.onPressed})
      : super(key: key);

  final VoidCallback onPressed;

  @override
  State<FloatingWithLoadingBtn> createState() => _FloatingWithLoadingBtnState();
}

class _FloatingWithLoadingBtnState extends State<FloatingWithLoadingBtn> {
  bool _isLoading = false;

  void _setLoading(bool value) => setState(() => _isLoading = value);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _isLoading
          ? null
          : () async {
              _setLoading(true);
              await Future(widget.onPressed);
              _setLoading(false);
            },
      child: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : const Icon(Icons.share),
    );
  }
}
