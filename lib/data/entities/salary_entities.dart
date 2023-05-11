class SalaryEntities {
  final String title;
  final String content;
  final String date;

  SalaryEntities({
    required this.title,
    required this.content,
    required this.date,
  });
}

final List<SalaryEntities> salaryEntitiesList = [
  SalaryEntities(
    title: 'SLIP GAJI BULAN JANUARI 2023',
    content: 'PENGHASILAN RUTIN',
    date: '2023-01-01',
  ),
  SalaryEntities(
    title: 'SLIP GAJI BULAN FEBRUARI 2023',
    content: 'PENGHASILAN RUTIN',
    date: '2023-02-01',
  ),
  SalaryEntities(
    title: 'SLIP GAJI BULAN MARET 2023',
    content: 'PENGHASILAN RUTIN',
    date: '2023-03-01',
  ),
  SalaryEntities(
    title: 'SLIP GAJI BULAN APRIL 2023',
    content: 'PENGHASILAN RUTIN',
    date: '2023-04-01',
  ),
  SalaryEntities(
    title: 'SLIP GAJI BULAN MEI 2023',
    content: 'PENGHASILAN RUTIN',
    date: '2023-05-01',
  ),
];
