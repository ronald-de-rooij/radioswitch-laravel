<?php

use App\Models\Stream;
use Livewire\Attributes\Validate;
use Livewire\Volt\Component;

new class extends Component {
    public Stream $stream;

    public string $title = '';
    public string $description = '';
    public string $image_url = '';
    public string $stream_url = '';

    protected $rules = [
        'title' => 'required|string|max:255',
        'description' => 'required|string|max:255',
        'image_url' => 'required|url|max:255',
        'stream_url' => 'required|url|max:255',
    ];

    public function mount(): void
    {
        $this->title = $this->stream->title;
        $this->description = $this->stream->description;
        $this->image_url = $this->stream->image_url;
        $this->stream_url = $this->stream->stream_url;
    }

    public function update(): void
    {
        $this->authorize('update', $this->stream);

        $validated = $this->validate();

        $this->stream->update($validated);

        $this->dispatch('stream-updated');
    }

    public function cancel(): void
    {
        $this->dispatch('stream-edit-canceled');
    }
}; ?>

<div>
    <form wire:submit.prevent="update">
        <input wire:model="title" type="text" class="mb-2 block w-full" placeholder="{{ __('Title') }}" />
        <x-input-error :messages="$errors->get('title')" class="my-2" />

        <textarea wire:model="description"
            class="mb-2 block w-full border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-md shadow-sm"
            placeholder="{{ __('What\'s on your mind?') }}"></textarea>
        <x-input-error :messages="$errors->get('description')" class="my-2" />

        <input wire:model="image_url" type="url" class="mb-2 block w-full" placeholder="{{ __('Image URL') }}" />
        <x-input-error :messages="$errors->get('image_url')" class="my-2" />

        <input wire:model="stream_url" type="url" class="mb-2 block w-full" placeholder="{{ __('Stream URL') }}" />
        <x-input-error :messages="$errors->get('stream_url')" class="my-2" />

        <x-primary-button class="mt-4"> {{ __('Save') }}</x-primary-button>
        <button class="mt-4" wire:click.prevent="cancel">Cancel</button>
    </form>
</div>
