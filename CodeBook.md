# Code Book

This codebook describes the variables in `tidyData.txt` in this repository.  For project background, see `README.md` file.

This is a tidy data set that each column is a variable and each row is for a given subject and a given activity.

## Identifier Variables
- `subject`: subject ID, integer, from 1 to 30.
- `activity`: activity name, character, with 6 possible values.

## Meaurements
The rest 79 variables are the mean of the measurements indicated by their variable names.  All measurements are floating-point values, normalised and bounded within [-1,1].
- "Time" denotes the raw time domain signal.
- "Frequency" denotes Frequency-domain signals resulting from the application of a Fast Fourier Transform (FFT) to the raw time-domain signals.
- "Accelerometer" denotes data from accelerometer.
- "Gyroscope" denotes data from gyroscope.
- "Magnitude" denotes magnitude of the signals.
- "X", "Y", "Z" denote the direction of the signals.
- The sensor acceleration signal has gravitational and body motion components denoted by "Gravity" and "Body".
- "Mean" and "StandardDeviation" are the calculations applied to raw data.

