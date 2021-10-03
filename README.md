# BankingServiceDB
[Portfolio] [SQL] Проект для создания базы данных Банковское обслуживание и демонстрации практических навыков T-SQL.

## Описание
Постановка задачи. Создать базу данных «Банковское обслуживание» содержащую информацию о банковских операциях с клиентами.
1) База данных должна содержать следующую информацию:
• Таблицу «Клиенты», содержащую следующую информацию о клиентах банка: Фамилия, Имя, Отчество, Телефон, Домашний адрес.
• Таблицу «Банки», содержащую информацию о банках: Наименование, Телефон, Адрес, Председатель правления совета директоров.
• Таблицу «Операции», содержащую информацию о банковских операциях: Операции, Сумма, Процент, Тип операции. 
2) Определить первичные и вторичные (внешние) ключи (если необходимо добавьте поля);
3) Установить связь между таблицами, предусмотрев обеспечение целостности данных;
4) Ввести тестовые записи в таблицы;
5) Создать следующие запросы:
• Запрос на групповые операции. Для определения банка выдавшего наибольшее количество кредитов. На экран вывести следующие поля: Наименование банка, Операции, Общее количество кредитов.
• Перекрестный запрос. Для отображения информации о количестве операций того или иного банка и операции.
• Параметрический запрос. Для определения операции больше определенной суммы, задаваемого параметром. На экран вывести следующие поля: Наименование банка, Сумма операции.
• Запрос на вычисляемое поле. Для отображения общей суммы к возврату каждой операции. На экран вывести следующие поля: Код операции, Операция, Фамилия клиента, телефон, Сумма к возврату = Сумма*(1+Процент).
• Запрос на создание таблицы. Для создания таблицы «ОперацииКопия» копии таблицы «Операции».
• Запрос на удаление. Для удаления информации из таблицы «ОперацииКопия» о пенсионных сбережениях.
