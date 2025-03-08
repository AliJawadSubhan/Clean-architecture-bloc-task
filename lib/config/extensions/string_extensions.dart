extension CustomStringAssetExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String toSvg() {
    return "assets/svgs/$this.svg";
  }
}
