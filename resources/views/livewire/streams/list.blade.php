<?php

use App\Models\Stream;
use Illuminate\Database\Eloquent\Collection;
use Livewire\Attributes\On;
use Livewire\Volt\Component;

new class extends Component {
    public Collection $streams;

    public ?Stream $editing = null;

    public function mount(): void
    {
        $this->getStreams();
    }

    #[On('stream-created')]
    public function getStreams(): void
    {
        $this->streams = Stream::with('user')
            ->latest()
            ->get();
    }

    public function edit(Stream $stream): void
    {
        $this->editing = $stream;

        $this->getStreams();
    }

    #[On('stream-edit-canceled')]
    #[On('stream-updated')]
    public function disableEditing(): void
    {
        $this->editing = null;

        $this->getStreams();
    }

    public function delete(Stream $stream): void
    {
        $this->authorize('delete', $stream);

        $stream->delete();

        $this->getStreams();
    }
}; ?>

<div class="mt-6 bg-white shadow-sm rounded-lg divide-y">
    @foreach ($streams as $stream)
        <div class="p-6 flex space-x-2" wire:key="{{ $stream->id }}">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-600 -scale-x-100" fill="none"
                viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round"
                    d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z" />
            </svg>
            <div class="flex-1">
                <div class="flex justify-between items-center">
                    <div>
                        <span class="text-gray-800">{{ $stream->user->name }}</span>
                        <small
                            class="ml-2 text-sm text-gray-600">{{ $stream->created_at->format('j M Y, g:i a') }}</small>
                        @unless ($stream->created_at->eq($stream->updated_at))
                            <small class="text-sm text-gray-600"> &middot; {{ __('edited') }}</small>
                        @endunless
                    </div>
                    @if ($stream->user->is(auth()->user()))
                        <x-dropdown>
                            <x-slot name="trigger">
                                <button>
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-gray-400"
                                        viewBox="0 0 20 20" fill="currentColor">
                                        <path
                                            d="M6 10a2 2 0 11-4 0 2 2 0 014 0zM12 10a2 2 0 11-4 0 2 2 0 014 0zM16 12a2 2 0 100-4 2 2 0 000 4z" />
                                    </svg>
                                </button>
                            </x-slot>
                            <x-slot name="content">
                                <x-dropdown-link wire:click="edit({{ $stream->id }})">
                                    {{ __('Edit') }}
                                </x-dropdown-link>
                                <x-dropdown-link wire:click="delete({{ $stream->id }})"
                                    wire:confirm="{{ __('Are you sure to delete this chirp?') }}">
                                    {{ __('Delete') }}
                                </x-dropdown-link>
                            </x-slot>
                        </x-dropdown>
                    @endif
                </div>
                @if ($stream->is($editing))
                    <livewire:streams.edit :stream="$stream" :key="$stream->id" />
                @else
                    <p class="mt-4 text-lg text-gray-900">{{ $stream->title }}</p>
                    <p class="mt-4 text-lg text-gray-900">{{ $stream->description }}</p>
                    <p class="mt-4 text-lg text-gray-900">{{ $stream->imageUrl }}</p>
                    <p class="mt-4 text-lg text-gray-900">{{ $stream->streamUrl }}</p>
                    <p class="mt-4 text-lg text-gray-900">{{ $stream->user_id }}</p>
                @endif
            </div>
        </div>
    @endforeach
</div>
