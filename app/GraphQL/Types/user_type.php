<?php

declare(strict_types=1);

namespace App\GraphQL\Types;

use App\Models\User;
use GraphQL\Type\Definition\Type;
use Rebing\GraphQL\Support\Facades\GraphQL;
use Rebing\GraphQL\Support\Type as GraphQLType;

class user_type extends GraphQLType
{
    protected $attributes = [
        'name' => 'User',
        'description' => 'A type',
        'model' => User::class,
    ];

    public function fields(): array
    {
        return [
            'id' => [
                'type' => Type::id(),
                'description' => 'unique id of the user'
            ],
            'user_name' => [
                'type' => Type::String(),
                'description' => 'name of every user'
            ],
            'contact' => [
                'type' => Type::String(),
                'description' => 'contact of user'
            ],
            'toys' => [
                'type' => Type::listOf(GraphQL::type('Toy'))
            ]
        ];
    }
}
