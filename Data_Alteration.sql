ALTER TABLE online_sports_betting
MODIFY COLUMN date date;

UPDATE online_sports_betting
SET win_rate = (Patron_win / Wag) * 100;

UPDATE online_sports_betting
SET Net_Wager = Wag - Cancelled_wag - Promo_Deduct;

ALTER TABLE online_sports_betting
ADD GGR DEC(15,2);

UPDATE online_sports_betting
SET GGR = Wag - Patron_win;

UPDATE online_sports_betting
SET NGR = GGR - Promo_Deduct - Coup_Credit_Wag - Fed_tax