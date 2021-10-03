---������ �� ��������� ��������. ��� ����������� ����� ��������� ���������� ���������� ��������. �� ����� ������� ��������� ����: ������������ �����, ��������, ����� ���������� ��������.
SELECT b.BankName, o.OperationName, COUNT(o.OperationId)
FROM [BankingServiceSchema].[Operation] o
LEFT JOIN [BankingServiceSchema].[Bank] b ON b.BankId = o.OperationBankId
WHERE o.OperationName = 'Obtaining loans'
GROUP BY b.BankName, o.OperationName
-- ������������ ������. ��� ����������� ���������� � ���������� �������� ���� ��� ����� ����� � ��������.
SELECT COUNT(o.OperationId) AS CountOperation, b.BankName,  o.OperationName
FROM [BankingServiceSchema].[Operation] o
LEFT JOIN [BankingServiceSchema].[Bank] b ON b.BankId = o.OperationBankId
GROUP BY b.BankName, o.OperationName
-- ��������������� ������. ��� ����������� �������� ������ ������������ �����, ����������� ����������. �� ����� ������� ��������� ����: ������������ �����, ����� ��������.
-- �������, � ������� 50000�
DECLARE @sum DECIMAL(19, 2) = 50000.00
SELECT b.BankName, SUM(o.OperationSum) AS OperationSum
FROM [BankingServiceSchema].[Operation] o
LEFT JOIN [BankingServiceSchema].[Bank] b ON b.BankId = o.OperationBankId
WHERE o.OperationSum > @sum
GROUP BY b.BankName
-- ������ �� ����������� ����. ��� ����������� ����� ����� � �������� ������ ��������. �� ����� ������� ��������� ����: ��� ��������, ��������, ������� �������, �������, ����� � �������� = �����*(1+�������).
SELECT o.OperationId, o.OperationName, c.ClientSurname, c.ClientPhone, o.OperationSum, o.OperationPercent, SUM(o.OperationSum) * (1 + o.OperationPercent/100) RefundAmount
FROM [BankingServiceSchema].[Operation] o
LEFT JOIN [BankingServiceSchema].[Bank] b ON b.BankId = o.OperationBankId
LEFT JOIN [BankingServiceSchema].[Client] c ON c.ClientId = b.BankClientId
GROUP BY o.OperationId, o.OperationName, c.ClientSurname, c.ClientPhone, o.OperationSum, o.OperationPercent
---������ �� �������� �������. ��� �������� ������� ��������������� ����� ������� ���������.
SELECT * INTO [BankingServiceSchema].[OperationCopy] FROM [BankingServiceSchema].[Operation];
---������ �� ��������. ��� �������� ���������� �� ������� ���������1� � ���������� �����������.
DELETE FROM [BankingServiceSchema].[OperationCopy]
WHERE [BankingServiceSchema].[OperationCopy].OperationName = 'Retirement savings'
SELECT o.OperationId, o.OperationName FROM [BankingServiceSchema].[OperationCopy] o;