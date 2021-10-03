---Запрос на групповые операции. Для определения банка выдавшего наибольшее количество кредитов. На экран вывести следующие поля: Наименование банка, Операции, Общее количество кредитов.
SELECT b.BankName, o.OperationName, COUNT(o.OperationId)
FROM [BankingServiceSchema].[Operation] o
LEFT JOIN [BankingServiceSchema].[Bank] b ON b.BankId = o.OperationBankId
WHERE o.OperationName = 'Obtaining loans'
GROUP BY b.BankName, o.OperationName
-- Перекрестный запрос. Для отображения информации о количестве операций того или иного банка и операции.
SELECT COUNT(o.OperationId) AS CountOperation, b.BankName,  o.OperationName
FROM [BankingServiceSchema].[Operation] o
LEFT JOIN [BankingServiceSchema].[Bank] b ON b.BankId = o.OperationBankId
GROUP BY b.BankName, o.OperationName
-- Параметрический запрос. Для определения операции больше определенной суммы, задаваемого параметром. На экран вывести следующие поля: Наименование банка, Сумма операции.
-- Возьмем, к примеру 50000р
DECLARE @sum DECIMAL(19, 2) = 50000.00
SELECT b.BankName, SUM(o.OperationSum) AS OperationSum
FROM [BankingServiceSchema].[Operation] o
LEFT JOIN [BankingServiceSchema].[Bank] b ON b.BankId = o.OperationBankId
WHERE o.OperationSum > @sum
GROUP BY b.BankName
-- Запрос на вычисляемое поле. Для отображения общей суммы к возврату каждой операции. На экран вывести следующие поля: Код операции, Операция, Фамилия клиента, телефон, Сумма к возврату = Сумма*(1+Процент).
SELECT o.OperationId, o.OperationName, c.ClientSurname, c.ClientPhone, o.OperationSum, o.OperationPercent, SUM(o.OperationSum) * (1 + o.OperationPercent/100) RefundAmount
FROM [BankingServiceSchema].[Operation] o
LEFT JOIN [BankingServiceSchema].[Bank] b ON b.BankId = o.OperationBankId
LEFT JOIN [BankingServiceSchema].[Client] c ON c.ClientId = b.BankClientId
GROUP BY o.OperationId, o.OperationName, c.ClientSurname, c.ClientPhone, o.OperationSum, o.OperationPercent
---Запрос на создание таблицы. Для создания таблицы «ОперацииКопия» копии таблицы «Операции».
SELECT * INTO [BankingServiceSchema].[OperationCopy] FROM [BankingServiceSchema].[Operation];
---Запрос на удаление. Для удаления информации из таблицы «Операции1» о пенсионных сбережениях.
DELETE FROM [BankingServiceSchema].[OperationCopy]
WHERE [BankingServiceSchema].[OperationCopy].OperationName = 'Retirement savings'
SELECT o.OperationId, o.OperationName FROM [BankingServiceSchema].[OperationCopy] o;