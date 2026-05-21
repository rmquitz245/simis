<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sex extends Model
{
    protected $table = 'sex';

    public function personnel()
    {
        return $this->hasMany(Personnel::class, 'sex_id_personnel_fk');
    }
}