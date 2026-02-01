
-- Daily Returns
SELECT
    trade_date,
    symbol,
    (close_price - LAG(close_price) OVER (PARTITION BY symbol ORDER BY trade_date))
    / LAG(close_price) OVER (PARTITION BY symbol ORDER BY trade_date) AS daily_return
FROM market_prices;

-- 7-Day Moving Average
SELECT
    trade_date,
    symbol,
    AVG(close_price) OVER (
        PARTITION BY symbol
        ORDER BY trade_date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS moving_avg_7d
FROM market_prices;
