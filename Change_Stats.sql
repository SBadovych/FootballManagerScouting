-- Remove the rec column, not needed
ALTER TABLE fmstats DROP COLUMN IF EXISTS rec;

-- Remove the inf column, not needed
ALTER TABLE fmstats DROP COLUMN IF EXISTS inf;

-- The FM database was providing weird outputs for Mins/gm, some players had hundreds of minutes a game, something not possible
UPDATE fmstats
SET "Mins/Gm" = fmstats.Mins::DECIMAL / fmstats.apps::DECIMAL;

-- Calculate per 90 stats and ratios, the ones that weren't done in here were done on Excel instead, easier to do
UPDATE fmstats
SET "Gls/90" = fmstats.Gls::DECIMAL / fmstats.Mins::DECIMAL * 90,
    "Shot/90" = fmstats.shots::DECIMAL / fmstats.Mins::DECIMAL * 90,
    "ShT/90" = fmstats."ShT"::DECIMAL / fmstats.Mins::DECIMAL * 90,
    "Pen/R" = CASE
        WHEN fmstats."Pens S" = 0 THEN 0
        ELSE COALESCE(fmstats.Pens::DECIMAL / NULLIF(fmstats."Pens S"::DECIMAL, 0), 0)
    END,
    "Ch C/90" = fmstats.CCC::DECIMAL / fmstats.Mins::DECIMAL * 90,
    "Asts/90" = fmstats.Ast::DECIMAL / fmstats.Mins::DECIMAL * 90,
    "K Ps/90" = fmstats."K Pas"::DECIMAL / fmstats.Mins::DECIMAL * 90,
    "Ps A/90" = fmstats."Pas A"::DECIMAL / fmstats.Mins::DECIMAL * 90,
    "Ps C/90" = fmstats."Ps C"::DECIMAL / fmstats.Mins::DECIMAL * 90,
    "Drb/90" = fmstats.Drb::DECIMAL / fmstats.Mins::DECIMAL * 90,
    "Aer A/90" = fmstats."Hdrs A"::DECIMAL / fmstats.Mins::DECIMAL * 90,
    "Hdrs W/90" = fmstats.Hdrs::DECIMAL / fmstats.Mins::DECIMAL * 90,
    "Tck" = fmstats."Tck"::DECIMAL / fmstats.Mins::DECIMAL * 90,
    "Int/90" = fmstats.Itc::DECIMAL / fmstats.Mins::DECIMAL * 90,
    "All/90" = fmstats.Clear::DECIMAL / fmstats.Mins::DECIMAL * 90,
    "Pens Saved" = fmstats."Pens Saved"::DECIMAL / fmstats.Mins::DECIMAL * 90;

UPDATE fmstats
SET "Shot %" = CASE WHEN fmstats.Shots = 0 THEN '0'
                    ELSE ROUND(fmstats."ShT"::DECIMAL / fmstats.Shots::DECIMAL)
               END;

-- Clean some of the database, as players with no mins played can't be scouted, useless data
DELETE FROM fmstats WHERE fmstats.mins IS NULL;

