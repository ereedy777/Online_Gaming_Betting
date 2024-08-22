ALTER TABLE online_sports_betting
MODIFY COLUMN date date;


ALTER TABLE online_sports_betting
ADD win_rate DECIMAL(10,2);

UPDATE online_sports_betting
SET win_rate = (Patron_win / Wag) * 100;

ALTER TABLE online_sports_betting
ADD Net_Wager DECIMAL(15,2);

UPDATE online_sports_betting
SET Net_Wager = Wag - Cancelled_wag - Promo_Deduct;

ALTER TABLE online_sports_betting
ADD GGR DEC(15,2);

UPDATE online_sports_betting
SET GGR = Wag - Patron_win;

ALTER TABLE online_sports_betting
ADD NGR DECIMAL(15,2);

UPDATE online_sports_betting
SET NGR = GGR - Promo_Deduct - Coup_Credit_Wag - Fed_tax