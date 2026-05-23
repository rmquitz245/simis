<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\Appointment;

class Branch extends Model
{
    use HasFactory;

    protected $table = 'branch';

    protected $primaryKey = 'branch_id';

    public $timestamps = false;

    protected $fillable = [
        'branch_name'
    ];

    public function appointments()
    {
        return $this->hasMany(
            Appointment::class,
            'branch_id_record_of_appointment_fk',
            'branch_id'
        );
    }
}