<?php
// filepath: /C:/projects-v2/udahal2.github.io/hitcount.php
$counterFile = 'counter.txt';

// Check if the counter file exists, if not create it and initialize to 0
if (!file_exists($counterFile)) {
    file_put_contents($counterFile, '0');
}

// Read the current count
$counter = (int)file_get_contents($counterFile);

// Increment the count
$counter++;

// Write the new count back to the file
file_put_contents($counterFile, (string)$counter);

// Output the count
echo $counter;
?>