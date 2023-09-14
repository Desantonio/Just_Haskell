import System.Process

-- Data for the bar plot (you can replace this with your own data)
dataPoints :: [(String, Double)]
dataPoints = [("A", 15), ("B", 20), ("C", 15), ("D", 30)]

-- Generate a GNUplot script to create the colorful bar plot
generateGnuplotScript :: [(String, Double)] -> String
generateGnuplotScript dataPoints = unlines $
    [ "set term pngcairo enhanced color"
    , "set output 'bar_plot.png'"
    , "set title 'Bar Plot'"
    , "set ylabel 'Values'"
    , "set style data histograms"
    , "set xtics rotate by -45"
    , "set boxwidth 0.8 relative"
    , "set style fill solid"
    , "set style histogram cluster gap 1"
    , "set key off"
    , "plot '-' using 2:xtic(1) lc rgb 'royalblue' title 'Data'"
    ] ++ map (\(label, value) -> label ++ " " ++ show value) dataPoints ++ ["e"]

main :: IO ()
main = do
    let gnuplotScript = generateGnuplotScript dataPoints
    writeFile "bar_plot.gnu" gnuplotScript
    _ <- system "gnuplot bar_plot.gnu"
    putStrLn "Bar plot generated as 'bar_plot.png'"
