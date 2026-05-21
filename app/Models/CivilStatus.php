<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CivilStatus extends Model
{
    protected $table = 'civil_status';

    public function personnel()
    {
        return $this->hasMany(Personnel::class, 'civil_status_id_personnel_fk');
    }
}