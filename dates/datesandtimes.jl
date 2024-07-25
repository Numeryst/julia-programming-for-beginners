
# Dates.Time object
# Dates.Date object
# Dates.DateTime object

rightnow = Dates.Time(Dates.now())

birthday = Dates.Date(1997, 3, 15)

datetime = Dates.DateTime(1910, 11, 11, 12, 12, 12)

datetoday = Dates.today()

datetimenow = Dates.now()

Dates.now(Dates.UTC)

Dates.DateTime("20190529 120000", "yyyymmdd HHMMSS")

Dates.DateTime("20/05/2020 16:12", "dd/mm/yyyy HH:MM")

vacation = Dates.DateTime("2020-09-02T08:20:07")

# Date and Time Queries

birthday = Dates.Date(1997, 4, 10)

datetoday = Dates.today()

Dates.year(birthday)

Dates.year(datetoday)

Dates.month(birthday)

Dates.month(datetoday)

Dates.day(birthday)

Dates.day(datetoday)

# For date/time objects

Dates.minute(now())

Dates.hour(now())

Dates.second(now())

rightnow = Dates.Time(Dates.now())

Dates.minute(rightnow)

Dates.hour(rightnow)

Dates.second(rightnow)

Dates.dayofweek(birthday)

Dates.dayname(birthday)

Dates.yearmonth(now())

Dates.yearmonthday(birthday)

Dates.isleapyear(birthday)

Dates.daysofweekinmonth(datetoday)

Dates.monthname(birthday)

Dates.monthday(now())

Dates.dayofweekofmonth(birthday)

# Date arithmetic

birthday = Dates.Date(1997, 4, 10)

datetoday = Dates.today()

datetime = Dates.DateTime(1910, 11, 11, 12, 12, 12)

datetoday - birthday

Dates.Period(datetoday - birthday)

Dates.canonicalize(Dates.CompoundPeriod(datetimenow - datetime))

convert(Dates.Day, Dates.Period(Dates.today() - Dates.Date(2016, 1, 1)))

convert(Dates.Millisecond, Dates.Period(Dates.today() - Dates.Date(2016, 1, 1)))

birthday

birthday + Dates.Year(20) + Dates.Month(6)

Dates.now() - Dates.Month(6)

Dates.now() - Dates.Year(2) - Dates.Month(6)

Dates.now() + Dates.Week(2) + Dates.Hour(12)

daystoxmas = Dates.Date(Dates.year(Dates.now()), 12, 25) - Dates.today()

Dates.value(daystoxmas)

lastchristmas = Dates.now() - Dates.DateTime(2017, 12, 25, 0, 0, 0)

Dates.value(lastchristmas)

# Range of dates

d = Dates.Date(1980,1,1):Dates.Month(3):Dates.Date(2019,1,1)

weekdays = filter(dy -> Dates.dayname(dy) != "Saturday" && 
                        Dates.dayname(dy) != "Sunday" , d)

d = collect(Dates.DateTime(Dates.now()):
            Dates.Hour(3):
            Dates.DateTime(Dates.now() + Dates.Year(1)))

foreach(d -> println(Dates.format(d, "d u yyyy")), 
            Dates.Date("2018-01-01"):
            Dates.Day(30):
            Dates.Date("2019-01-01"))


# Date formatting
#=
y  Year digit eg yyyy => 2015, yy => 15
m  Month digit eg m => 3 or 03
u  Month name eg Jan
U  Month name eg January
e  Day of week eg Tue
E  Day of week eg Tuesday
d  Day eg 3 or 03
H  Hour digit eg HH => 00
M  Minute digit eg MM => 00
S  Second digit eg S => 00
s  Millisecond digit eg .000
=#

Dates.Date("Fri, 15 Jun 2018", "e, d u y")

Dates.DateTime("Fri, 15 Jun 2018 11:43:14", "e, d u y H:M:S")

timenow = Dates.now()

Dates.format(timenow, "e, dd u yyyy HH:MM:SS")

anothertime = Dates.DateTime("Tue, 8 Jul 2015 2:3:7", "e, d u y H:M:S")

Dates.format(anothertime, "e: dd u yy, HH.MM.SS")

Dates.format(anothertime, "e: d u yy, H.M.S")

formatted_date = "Tue, 28 Jul 2015 11:43:14"

temp = Dates.DateTime(formatted_date, "e, dd u yyyy HH:MM:SS")

Dates.format(temp, "dd, U, yyyy HH:MM, e")

dformat = Dates.DateFormat("y-m-d");

Dates.Date.([   # broadcast
      "2010-01-01", 
      "2011-03-23", 
      "2012-11-3", 
      "2013-4-13", 
      "2014-9-20", 
      "2015-3-1"
      ], dformat)

Dates.DateTime.([  
"2010-01-01", 
"2011-03-23", 
"2012-11-3", 
"2013-4-13", 
"2014-9-20", 
"2015-3-1" 
], Dates.ISODateTimeFormat)

Dates.format(Dates.now(), Dates.RFC1123Format)

# Date adjustments

Dates.dayname(now())

Dates.firstdayofweek(now())

# which you could also write using the function chain operator

Dates.now() |> Dates.firstdayofweek |> Dates.dayname 

Dates.tonext(d->Dates.dayofweek(d) == Dates.Tuesday, birthday)

Dates.tonext(d->Dates.dayname(d) == "Sunday", birthday)

Dates.tofirst(birthday, 1)

Dates.tofirst(birthday, 1, of=Year)

# Rounding dates and times

Dates.now()

Dates.format(round(Dates.DateTime(Dates.now()), 
            Dates.Minute(15)), 
            Dates.RFC1123Format)

birthday

ceil(birthday, Dates.Month)

ceil(birthday, Dates.Week)

# Moments in time

moment=Dates.now()

Dates.value(moment)

moment.instant

moment = Dates.Time(Dates.now())

Dates.value(moment)

moment.instant

# Timing and monitoring

function test(n)
    for i in 1:n
        x = sin(rand())
    end
end

@elapsed test(1000)

@time test(1000)