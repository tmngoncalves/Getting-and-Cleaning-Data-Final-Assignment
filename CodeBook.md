## Code Book
Before giving an explanation of the variables present in the data set files
MeanStandardDeviationKinematicVariables.txt and SummaryKinematicVariables.txt, 
it is pertinent to explain a little bit about the variables collected in the 
embedded sensor signals in the Samsung Galaxy S II smartphones (available in
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>). 

There are two sensor signals: the accelerometer and the gyroscope. The former 
measures the acceleration and the latter the angular velocity. As these measures 
correspond to vectors in the three dimensions, which can be represented by 
*(x,y,z)* in the Cartesian Coordinate System, they have been divided into three 
variables, one for each component of the vector.

Furthermore, the acceleration has also been divided in two parts, the body and 
gravity accelerations, and it is the three-dimensional components of these 
accelerations that show up in the data sets.

The rates of change for the body acceleration and the angular velocity with 
respect to time were derived and these are known as jerks.

The body and gravity acceleration, and the angular velocity are variables that 
depend on time. By applying a Fourier transform (FT), these variables are 
transformed into new variables that now depend on frequency instead of time.

Since the body and gravity accelerations and their jerks, as well as the body
angular velocity and its jerk are vectors, their magnitudes can be calculated: 
they correspond to the Euclidean length of those vectors.

Next is a list of all the variables present in the above-mentioned data sets:

* **subjectIdentifier**: as the variable name says, this variable refers to the 
label associated with each subject for each window sample in the experiment. As there were 30 volunteers, these have been identified by the numbers from 1 to 30;

* **activity**: this variable corresponds to one of the six activities performed 
by the subjects for each window sample: walking, walking upstairs, walking downstairs, sitting, standing and laying;

* **meanBodyAccX**: this variable corresponds to the mean of the *x*-component
of the body acceleration for each window sample and is given in standard units 
g;

* **meanBodyAccY**: this variable corresponds to the mean of the *y*-component
of the body acceleration for each window sample and is given in standard units 
g;

* **meanBodyAccZ**: this variable corresponds to the mean of the *z*-component
of the body acceleration for each window sample and is given in standard units 
g;

* **meanGravityAccX**: this variable corresponds to the mean of the 
*x*-component of the gravity acceleration for each window sample and is given in
standard units g;

* **meanGravityAccY**: this variable corresponds to the mean of the 
*y*-component of the gravity acceleration for each window sample and is given in
standard units g;

* **meanGravityAccZ**: this variable corresponds to the mean of the 
*z*-component of the gravity acceleration for each window sample and is given in
standard units g;

* **meanBodyAccJerkX**: this variable corresponds to the mean of the 
*x*-component of the body acceleration jerk for each window sample and is given 
in g/s;

* **mean BodyAccJerkY**: this variable corresponds to the mean of the 
*y*-component of the body acceleration jerk for each window sample and is given 
in g/s;

* **meanBodyAccJerkZ**: this variable corresponds to the mean of the 
*z*-component of the body acceleration jerk for each window sample and is given 
in g/s;

* **meanBodyAngVelocityX**: this variable corresponds to the mean of the 
*x*-component of the body angular velocity for each window sample and is given 
in rad/s;

* **meanBodyAngVelocityY**: this variable corresponds to the mean of the 
*y*-component of the body angular velocity for each window sample and is given 
in rad/s;

* **meanBodyAngVelocityZ**: this variable corresponds to the mean of the 
*z*-component of the body angular velocity for each window sample and is given 
in rad/s;

* **meanBodyAngVelocityJerkX**: this variable corresponds to the mean of the 
*x*-component of the body angular velocity jerk for each window sample and is 
given in rad/s²;

* **meanBodyAngVelocityJerkY**: this variable corresponds to the mean of the 
*y*-component of the body angular velocity jerk for each window sample and is 
given in rad/s²;

* **meanBodyAngVelocityJerkZ**: this variable corresponds to the mean of the 
*z*-component of the body angular velocity jerk for each window sample and is 
given in rad/s²;

* **meanBodyAccMagnitude**: this variable corresponds to the mean of the body 
acceleration magnitude for each window sample and is given in standard units g;

* **meanGravityAccMagnitude**: this variable corresponds to the mean of the 
gravity acceleration magnitude for each window sample and is given in standard 
units g;

* **meanBodyAccJerkMagnitude**: this variable corresponds to mean of the body 
acceleration jerk magnitude for each window sample and is given in g/s;

* **meanBodyAngVelocityMagnitude**: this variable corresponds to the mean of the
body angular velocity magnitude for each window sample and is given in rad/s;

* **meanBodyAngVelocityJerkMagnitude**: this variable corresponds to the mean of
the body angular velocity jerk magnitude for each window sample and is given in
rad/s²;

* **meanFTBodyAccX**: this variable corresponds to the mean of the Fourier 
transform of the *x*-component of the body acceleration for each window sample 
and is given in standard units g;

* **meanFTBodyAccY**: this variable corresponds to the mean of the Fourier 
transform of the *y*-component of the body acceleration for each window sample 
and is given in standard units g;

* **meanFTBodyAccZ**: this variable corresponds to the mean of the Fourier 
transform of the *z*-component of the body acceleration for each window sample 
and is given in standard units g;

* **meanFTBodyAccJerkX**: this variable corresponds to the mean of the Fourier 
transform of the *x*-component of the body acceleration jerk for each window 
sample and is given in g/s;

* **meanFTBodyAccJerkY**: this variable corresponds to the mean of the Fourier 
transform of the *y*-component of the body acceleration jerk for each window 
sample and is given in g/s;

* **meanFTBodyAccJerkZ**: this variable corresponds to the mean of the Fourier 
transform of the *z*-component of the body acceleration jerk for each window 
sample and is given in g/s;

* **meanFTBodyAngVelocityX**: this variable corresponds to the mean of the
Fourier transform of the *x*-component of the body angular velocity for each 
window sample and is given in rad/s;

* **meanFTBodyAngVelocityY**: this variable corresponds to the mean of the
Fourier transform of the *y*-component of the body angular velocity for each 
window sample and is given in rad/s;

* **meanFTBodyAngVelocityZ**: this variable corresponds to the mean of the
Fourier transform of the *z*-component of the body angular velocity for each 
window sample and is given in rad/s;

* **meanFTBodyAccMagnitude**: this variable corresponds to the mean of the 
Fourier transform of the body acceleration magnitude for each window sample and
is given in standard units g;

* **meanFTBodyAccJerkMagnitude**: this variable corresponds to the mean of the 
Fourier transform of the body acceleration jerk magnitude for each window sample 
and is given in g/s;

* **meanFTBodyAngVelocityMagnitude**: this variable corresponds to the mean of 
Fourier transform of the body angular velocity magnitude for each window sample
and is given in rad/s;

* **meanFTBodyAngVelocityJerkMagnitude**: this variable corresponds to the mean 
of Fourier transform of the body angular velocity jerk magnitude for each window 
sample and is given in rad/s²;

* **SdBodyAccX**: this variable corresponds to the standard deviation of the 
*x*-component of the body acceleration for each window sample and is given in 
standard units g;

* **SdBodyAccY**: this variable corresponds to the standard deviation of the 
*y*-component of the body acceleration for each window sample and is given in 
standard units g;

* **SdBodyAccZ**: this variable corresponds to the standard deviation of the 
*z*-component of the body acceleration for each window sample and is given in 
standard units g;

* **SdGravityAccX**: this variable corresponds to the standard deviation of the *x*-component of the gravity acceleration for each window sample and is given in
standard units g;

* **SdGravityAccY**: this variable corresponds to  the standard deviation of the *y*-component of the gravity acceleration for each window sample and is given in
standard units g;

* **SdGravityAccZ**: this variable corresponds to  the standard deviation of the *z*-component of the gravity acceleration for each window sample and is given in
standard units g;

* **SdBodyAccJerkX**: this variable corresponds to the standard deviation of the 
*x*-component of the body acceleration jerk for each window sample and is given 
in g/s;

* **SdBodyAccJerkY**: this variable corresponds to the standard deviation of the 
*y*-component of the body acceleration jerk for each window sample and is given 
in g/s;

* **SdBodyAccJerkZ**: this variable corresponds to the standard deviation of the 
*z*-component of the body acceleration jerk for each window sample and is given 
in g/s;

* **SdBodyAngVelocityX**: this variable corresponds to the standard deviation of
the *x*-component of the body angular velocity for each window sample and is 
given in rad/s;

* **SdBodyAngVelocityY**: this variable corresponds to the standard deviation of
the *y*-component of the body angular velocity for each window sample and is 
given in rad/s;

* **SdBodyAngVelocityZ**: this variable corresponds to the standard deviation of
the *z*-component of the body angular velocity for each window sample and is 
given in rad/s;

* **SdBodyAngVelocityJerkX**: this variable corresponds to the standard 
deviation of the *x*-component of the body angular velocity jerk for each window
sample and is given in rad/s²;

* **SdBodyAngVelocityJerkY**: this variable corresponds to the standard 
deviation of the *y*-component of the body angular velocity jerk for each window
sample and is given in rad/s²;

* **SdBodyAngVelocityJerkZ**: this variable corresponds to the standard 
deviation of the *z*-component of the body angular velocity jerk for each window
sample and is given in rad/s²;

* **SdBodyAccMagnitude**: this variable corresponds to the standard deviation of 
the body acceleration magnitude for each window sample and is given in standard units g;
* **SdGravityAccMagnitude**: this variable corresponds to the standard deviation
of the gravity acceleration magnitude for each window sample and is given in 
standard units g;

* **SdBodyAccJerkMagnitude**: this variable corresponds to the standard 
deviation of the body acceleration jerk magnitude for each window sample and is 
given in g/s;

* **SdBodyAngVelocityMagnitude**: this variable corresponds to the standard 
deviation of the body angular velocity magnitude for each window sample and is
given in rad/s;

* **SdBodyAngVelocityJerkMagnitude**: this variable corresponds to the standard
deviation of the body angular velocity jerk magnitude for each window sample
and is given in rad/s²;

* **SdFTBodyAccX**: this variable corresponds to the standard deviation of the Fourier transform of the *x*-component of the body acceleration for each window
sample and is given in standard units g;

* **SdFTBodyAccY**: this variable corresponds to the standard deviation of the Fourier transform of the *y*-component of the body acceleration for each window
sample and is given in standard units g;

* **SdFTBodyAccZ**: this variable corresponds to the standard deviation of the Fourier transform of the *z*-component of the body acceleration for each window
sample and is given in standard units g;

* **SdFTBodyAccJerkX**: this variable corresponds to the standard deviation of 
the Fourier transform of the *x*-component of the body acceleration jerk for 
each window sample and is given in g/s;

* **SdFTBodyAccJerkY**: this variable corresponds to the standard deviation of 
the Fourier transform of the *y*-component  of the body acceleration jerk for 
each window sample and is given in g/s;

* **SdFTBodyAccJerkZ**: this variable corresponds to the standard deviation of 
the Fourier transform of the *z*-component of the body acceleration jerk for 
each window sample and is given in g/s;

* **SdFTBodyAngVelocityX**: this variable corresponds to the standard deviation 
of the Fourier transform of the *x*-component of the body angular velocity for 
each window sample and is given in rad/s;

* **SdFTBodyAngVelocityY**: this variable corresponds to the standard deviation 
of the Fourier transform of the *y*-component of the body angular velocity for 
each window sample and is given in rad/s;

* **SdFTBodyAngVelocityZ**: this variable corresponds to the standard deviation 
of the Fourier transform of the *z*-component of the body angular velocity for 
each window sample and is given in rad/s;

* **SdFTBodyAccMagnitude**: this variable corresponds to the standard deviation
of the Fourier transform of the body acceleration magnitude for each window 
sample and is given standard units g;

* **SdFTBodyAccJerkMagnitude**: this variable corresponds to the standard 
deviation of the Fourier transform of the body acceleration jerk magnitude for
each window sample and is given in g/s;

* **SdFTBodyAngVelocityMagnitude**: this variable corresponds to the standard 
deviation of the Fourier transform of the body angular velocity magnitude for
each window sample and is given in rad/s;

* **SdFTBodyAngVelocityJerkMagnitude**: this variable corresponds to the 
standard deviation of the Fourier transform of the body angular velocity jerk magnitude for each window sample and is given in rad/s².


