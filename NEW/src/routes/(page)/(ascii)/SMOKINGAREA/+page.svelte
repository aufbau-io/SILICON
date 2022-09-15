<script>
	import { user } from '$lib/store/sessionStore';
	import { supabase } from '$lib/clients/supabaseClient';
	import Auth from '$lib/components/auth/Auth.svelte';
	import Profile from '$lib/components/auth/Profile.svelte';
	user.set(supabase.auth.user());

	supabase.auth.onAuthStateChange((_, session) => {
		user.set(session.user);
	});
</script>

<section />

<style>
	section {
		padding: 0 40px;
	}
</style>
