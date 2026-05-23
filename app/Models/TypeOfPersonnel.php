<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\JobPosition;

class TypeOfPersonnel extends Model
{
    use HasFactory;

    protected $table = 'type_of_personnel';

    protected $primaryKey = 'type_of_personnel_id';

    public $timestamps = false;

    public function positions()
    {
        return $this->hasMany(
            JobPosition::class,
            'type_of_personnel_id_job_position_fk',
            'type_of_personnel_id'
        );
    }
}