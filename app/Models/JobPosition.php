<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\Appointment;
use App\Models\SalaryGrade;
use App\Models\TypeOfPersonnel;

class JobPosition extends Model
{
    use HasFactory;

    protected $table = 'position';

    protected $primaryKey = 'job_position_id';

    public $timestamps = false;

    protected $fillable = [
        'job_position_title',
        'salary_grade_id_job_position_fk',
        'type_of_personnel_id_job_position_fk'
    ];

    public function appointments()
    {
        return $this->hasMany(
            Appointment::class,
            'job_position_id_record_of_appointment_fk',
            'job_position_id'
        );
    }

    public function salaryGrade()
    {
        return $this->belongsTo(
            SalaryGrade::class,
            'salary_grade_id_job_position_fk',
            'salary_grade_id'
        );
    }

    public function typeOfPersonnel()
    {
        return $this->belongsTo(
            TypeOfPersonnel::class,
            'type_of_personnel_id_job_position_fk',
            'type_of_personnel_id'
        );
    }
}