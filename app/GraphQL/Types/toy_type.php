<?php

declare(strict_types=1);

namespace App\GraphQL\Types;

use App\Models\Toy;
use GraphQL\Type\Definition\Type;
use Rebing\GraphQL\Support\Facades\GraphQL;
use Rebing\GraphQL\Support\Type as GraphQLType;

class toy_type extends GraphQLType
{
    protected $attributes = [
        'name' => 'Toy',
        'description' => 'A type',
        'model' => Toy::class,
    ];

    public function fields(): array
    {
        return [
            'id' => [
                'type' => Type::id(),
                'description' => 'unique id of the toy'

            ],
            'toy_name' => [
                'type' => Type::String(),
                'description' => 'name of the toy to exchange'
            ],
            'status' => [
                'type' => Type::String(),
                'description' => 'status of toy which is active or inactive'
            ],
            'exchange_to' => [
                'type' => Type::String(),
                'description' => 'Name of toy wanted'
            ],
            'user' => [
                'type' => GraphQL::type('User'),
            ],
            'images' => [
                'type' => Type::listOf(GraphQL::type('Image'))
            ]
        ];
    }
}
