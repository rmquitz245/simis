<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\JobPosition;

class SalaryGrade extends Model
{
    use HasFactory;

    protected $table = 'salary_grade';

    protected $primaryKey = 'salary_grade_id';

    public $timestamps = false;

    public function positions()
    {
        return $this->hasMany(
            JobPosition::class,
            'salary_grade_id_job_position_fk',
            'salary_grade_id'
        );
    }
}