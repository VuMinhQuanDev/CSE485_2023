<?php
// open file
$file = fopen("dssv.txt", "r");

// craet array sv
$ds_sv = array();

// Read every line of the file
while (($line = fgets($file)) !== false) {
  // Split the words in each data line into an array of words
  $words = explode(' ', $line);

  $sv = new stdClass();
  $sv->id = $words[0];
  $sv->name = $words[1];
  $sv->age = $words[2];
  $sv->grade = $words[3];

  // Put data on the SV list
  array_push($ds_sv, $sv);
}

// close file
fclose($file);

// show data by table

foreach ($ds_sv as $sv) {
    echo "<tr>";
    echo "<td>" . $sv->id . "</td>";
    echo "<td>" . $sv->name . "</td>";
    echo "<td>" . $sv->age . "</td>";
    echo "<td>" . $sv->grade . "</td>";
    echo "</tr>";
}
?>


