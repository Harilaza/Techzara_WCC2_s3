<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Image
 * 
 * @property int $id
 * @property string $toy_uri
 * @property int $toy_id
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property Toy $toy
 *
 * @package App\Models
 */
class Image extends Model
{
	protected $table = 'images';

	protected $casts = [
		'toy_id' => 'int'
	];

	protected $fillable = [
		'toy_uri',
		'toy_id'
	];

	public function toy()
	{
		return $this->belongsTo(Toy::class);
	}
}
