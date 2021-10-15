module Ex2_8_6 exposing (..)

type alias Date = {year: Int, month: Int, day: Int}
type alias CardNumber = {firstHalf: Int, secondHalf: Int}
type Issuer = Visa | Mastercard
type alias CreditCard = {issuer: Issuer, cardNb: CardNumber, expDate: Date}

isDateAfter : Date -> Date -> Bool
isDateAfter date1 date2 =
    if (date1.year < date2.year) || ((date1.year == date2.year) && (date1.month < date1.month)) ||
        ((date1.year == date2.year) && (date1.month == date1.month) && date1.day < date2.day)
        then True
        else False

isCardNumberValid : CardNumber -> Issuer -> Bool
isCardNumberValid cn iss =
    case iss of
        Visa -> if toFloat cn.firstHalf / 10000000.0 == 4.0 then True else False
        Mastercard -> if (toFloat cn.firstHalf / 10000.0 <= 2720.0 && toFloat cn.firstHalf / 10000.0 >= 2221.0) ||
                          (toFloat cn.firstHalf / 1000000.0 <= 55.0 && toFloat cn.firstHalf / 1000000.0 >= 51.0)
                          then True
                          else False

validateCard : Date -> CreditCard -> Bool
validateCard d cc = if (isDateAfter cc.expDate d) && (isCardNumberValid cc.cardNb cc.issuer) then True else False
