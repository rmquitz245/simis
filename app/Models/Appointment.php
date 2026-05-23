<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Appointment extends Model
{
    use HasFactory;

    protected $table = 'record_of_appointment';

    protected $fillable = [

        'personnel_id_record_of_appointment_fk',

        'job_position_id_record_of_appointment_fk',

        'employment_status_id_record_of_appointment_fk',

        'station_id_record_of_appointment_fk',

        'nature_of_appointment_id_record_of_appointment_fk',

        'vice_predecessor_name',

        'vice_type_id_record_of_appointment_fk',

        'date_of_appointment',

        'plantilla_item_no',

        'appointment_status_id_record_of_appointment_fk',

        'branch_id_record_of_appointment_fk'
    ];

    public function personnel()
    {
        return $this->belongsTo(Personnel::class, 'personnel_id_record_of_appointment_fk');
    }
    public function jobPosition()
    {
    return $this->belongsTo(
        JobPosition::class,
        'job_position_id_record_of_appointment_fk',
        'job_position_id'
    );
    }
    public function employmentStatus()
    {
        return $this->belongsTo(
            EmploymentStatus::class,
            'employment_status_id_record_of_appointment_fk'
        );
    }
    
    public function station()
    {
        return $this->belongsTo(
            Station::class,
            'station_id_record_of_appointment_fk',
            'station_id'
        );
    }
    public function natureOfAppointment()
    {
    return $this->belongsTo(
        NatureOfAppointment::class,
        'nature_of_appointment_id_record_of_appointment_fk', // FK in appointments table
        'nature_of_appointment_id' // PK in nature_of_appointment table
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
    public function appointmentStatus()
    {
    return $this->belongsTo(
        AppointmentStatus::class,
        'appointment_status_id_record_of_appointment_fk', // FK in record_of_appointment
        'appointment_status_id' // PK in appointment_status table
    );
    }
    public function branch()
    {
    return $this->belongsTo(
        Branch::class,
        'branch_id_record_of_appointment_fk', // FK in record_of_appointment
        'branch_id' // PK in branch table
    );
    }
    
}