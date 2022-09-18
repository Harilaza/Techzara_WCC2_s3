<?php

declare(strict_types=1);

namespace App\GraphQL\Types;

use App\Models\Image;
use GraphQL\Type\Definition\Type;
use Rebing\GraphQL\Support\Type as GraphQLType;

class image_type extends GraphQLType
{
    protected $attributes = [
        'name' => 'Image',
        'description' => 'A type',
        'model' => Image::class,
    ];

    public function fields(): array
    {
        return [
            'toy_id' => [
                'type' => Type::int(),
                'description' => 'unique id of the toy correspond to the image'
            ],
            'toy_uri' => [
                'type' => Type::String(),
                'description' => 'the uri of the imager'
            ]
        ];
    }
}
