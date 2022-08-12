enum StringProvider {
  valueNull(code: '01'),
  value404(code: '02'),
  value500(code: '03'),
  valuefailedDecodeObject(code: '04'),
  valuefailed(code: '05'),
  value401(code: '06'),
  valueSucces(code: '07'),
  valueCatchHttp(code: '08');

  final String code;
  const StringProvider({required this.code});
}
