<script>
	import { animations } from '$lib/store/store.js';

	let toggleAnimations = () => {
		animations.update((val) => !val);
	};
</script>

<section>
	<span class="mono sml">
		<p>Animations:&nbsp;</p>
		<span class="toggle" on:click={toggleAnimations}>
			<p class:active={$animations}>ON</p>
			<p>/</p>
			<p class:active={!$animations}>OFF</p>
		</span>
	</span>
</section>

<style>
	span {
		display: flex;
		user-select: none;
	}
	p {
		line-height: 120%;
		padding: 0 0.4rem;
	}
	.toggle {
		cursor: pointer;
	}
	.active {
		background: var(--pink);
		color: var(--black);
	}
</style>
