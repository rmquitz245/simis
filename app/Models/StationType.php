<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\Station;

class StationType extends Model
{
    use HasFactory;

    protected $table = 'station_types';

    protected $primaryKey = 'station_type_id';

    public $timestamps = false;

    protected $fillable = [
        'station_type_name'
    ];

    public function stations()
    {
        return $this->hasMany(
            Station::class,
            'station_type_id_fk',
            'station_type_id'
        );
    }
}