
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PersonnelController;
Route::get('/', function () {
    return view('welcome');
    //return 'SIMIS WORKING';
});


Route::resource('personnel', PersonnelController::class);

Route::get('/get-provinces/{regionId}',
    [PersonnelController::class, 'getProvinces']);

Route::get('/get-municipalities/{provinceId}',
    [PersonnelController::class, 'getMunicipalities']);

Route::get('/get-barangays/{municipalityId}',
    [PersonnelController::class, 'getBarangays']);

Route::post('/personnel',
    [PersonnelController::class, 'store']);