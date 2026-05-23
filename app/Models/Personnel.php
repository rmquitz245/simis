<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Appointment;

class Personnel extends Model
{
    protected $table = 'personnel';
    protected $primaryKey = 'personnel_id';

    protected $fillable = [
    'personnel_last_name',
    'personnel_first_name',
    'personnel_middle_name',
    'employee_no',
    'sex_id_personnel_fk',
    'civil_status_id_personnel_fk',
    'personnel_birthdate',
    'birth_place',
    'permanent_address_barangay_id',
    'permanent_address_street',
    'permanent_address_subdivision_village',
    'permanent_address_house_block_lot_no',
    'present_address_barangay_id',
    'present_address_street',
    'present_address_subdivision_village',
    'present_address_house_block_lot_no',
    'umid_id_no',
    'pag_ibig_no',
    'phil_health_no',
    'phil_sys_no',
    'tin_no'
    ];

    /*
    |-------------------------
    | LOOKUP TABLES (belongsTo)
    |-------------------------
    */

    public function sex()
    {
        return $this->belongsTo(Sex::class, 'sex_id_personnel_fk', 'sex_id');
    }

    public function civilStatus()
    {
        return $this->belongsTo(CivilStatus::class, 'civil_status_id_personnel_fk', 'civil_status_id');
    }
    public function birthPlace()
    {
        return $this->belongsTo(Municipality::class, 'birth_place');
    }
    public function permanentBarangay()
    {
        return $this->belongsTo(Barangay::class, 'permanent_address_barangay_id');
    }

    public function presentBarangay()
    {
        return $this->belongsTo(Barangay::class, 'present_address_barangay_id');
    }
    public function appointments()
    {
    return $this->hasMany(Appointment::class, 'personnel_id_record_of_appointment_fk');
    }
    public function scopeAvailableForAppointment($query)
    {
    return $query->whereDoesntHave('appointments', function ($q) {
        $q->where('appointment_status_id_record_of_appointment_fk', 1); // ACTIVE
    });
    }
}
