<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Region extends Model
{
    protected $table = 'region';

    public function provinces()
    {
        return $this->hasMany(Province::class, 'region_id_province_fk');
    }
}