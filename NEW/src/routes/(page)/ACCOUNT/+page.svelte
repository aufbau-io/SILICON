<script>
	import { user } from '$lib/store/sessionStore';
	import { supabase } from '$lib/clients/supabaseClient';
	import Auth from '$lib/components/auth/Auth.svelte';
	import Profile from '$lib/components/auth/Profile.svelte';

	import Hero from '$lib/components/common/pageHero.svelte';

	user.set(supabase.auth.user());

	supabase.auth.onAuthStateChange((_, session) => {
		user.set(session.user);
	});
</script>

<section>
	{#if $user}
		<Hero name="bag check" />
		<Profile />
	{:else}
		<Hero name="security" />
		<Auth />
	{/if}
</section>

<style>
	section {
		padding: 0 40px;
	}
</style>
