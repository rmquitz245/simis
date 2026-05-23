<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\Appointment;

class AppointmentStatus extends Model
{
    use HasFactory;

    protected $table = 'appointment_status';

    protected $primaryKey = 'appointment_status_id';

    public $timestamps = false;

    protected $fillable = [
        'appointment_status_name'
    ];

    public function appointments()
    {
        return $this->hasMany(
            Appointment::class,
            'appointment_status_id_record_of_appointment_fk',
            'appointment_status_id'
        );
    }
}