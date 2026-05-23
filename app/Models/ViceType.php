<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\Appointment;

class ViceType extends Model
{
    use HasFactory;

    protected $table = 'vice_type';

    protected $primaryKey = 'vice_type_id';

    public $timestamps = false;

    protected $fillable = [
        'vice_type_name'
    ];

    public function appointments()
    {
        return $this->hasMany(
            Appointment::class,
            'vice_type_id_record_of_appointment_fk',
            'vice_type_id'
        );
    }
    
}