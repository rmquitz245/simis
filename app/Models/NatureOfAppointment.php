<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\Appointment;

class NatureOfAppointment extends Model
{
    use HasFactory;

    protected $table = 'nature_of_appointment';

    protected $primaryKey = 'nature_of_appointment_id';

    public $timestamps = false;

    protected $fillable = [
        'nature_of_appointment_name'
    ];

    public function appointments()
    {
        return $this->hasMany(
            Appointment::class,
            'nature_of_appointment_id_record_of_appointment_fk',
            'nature_of_appointment_id'
        );
    }
    public function viceType()
    {
    return $this->belongsTo(
        ViceType::class,
        'vice_type_id_record_of_appointment_fk', // FK in appointments table
        'vice_type_id' // PK in vice_type table
    );
    }
}