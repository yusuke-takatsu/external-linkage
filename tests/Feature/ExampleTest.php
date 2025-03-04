<?php

namespace Tests\Feature;

// use Illuminate\Foundation\Testing\RefreshDatabase;

use App\Models\Profile;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ExampleTest extends TestCase
{
    use RefreshDatabase;

    /**
     * A basic test example.
     */
    public function test_the_application_returns_a_successful_response(): void
    {
        $user = User::factory()->create();
        $profile = Profile::factory()->for($user)->create();

        $this->assertDatabaseHas('users', ['id' => $user->id], 'template_mysql');
        $this->assertDatabaseHas('profiles', ['id' => $profile->id]);
    }
}
