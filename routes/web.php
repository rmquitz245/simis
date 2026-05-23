
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PersonnelController;
use App\Http\Controllers\AppointmentController;


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

Route::get('/employment/appointments/create', [AppointmentController::class, 'create'])
    ->name('appointments.create');

Route::post('/employment/appointments/store', [AppointmentController::class, 'store'])
    ->name('appointments.store');
Route::get('/employment/appointments', [AppointmentController::class, 'index']);