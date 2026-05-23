<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Appointment; // ✔ REQUIRED

class Station extends Model
{
    protected $table = 'station'; // ✔ IMPORTANT FIX

    protected $primaryKey = 'station_id'; // make sure this matches your PK
    
    public function appointments()
    {
        return $this->hasMany(
            Appointment::class,
            'station_id_record_of_appointment_fk',
            'station_id'
        );
    }
    public function stationType()
    {
    return $this->belongsTo(
        StationType::class,
        'station_type_id_fk',
        'station_type_id'
    );
    }
}