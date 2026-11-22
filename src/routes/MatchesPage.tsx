import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import {
  Search,
  Filter,
  CheckCircle2,
  Sparkles,
  ArrowRight,
  Bookmark,
  BookmarkCheck,
  Shield,
  ExternalLink,
} from 'lucide-react';
import { useCitizenProfile } from '../core/profile/ProfileContext';
import { defaultDiscoveryService } from '../core/discovery/discovery-service';
import { defaultClaimTrackerService } from '../core/tracker/claim-tracker';
import { NATIONAL_STATE_COVERAGE } from '../core/data/coverage-registry';
import { StatusChip } from '../components/ui/StatusChip';
import { Card } from '../components/ui/Card';
import { Button } from '../components/ui/Button';

export function MatchesPage() {
  const navigate = useNavigate();
  const { profile } = useCitizenProfile();

  const [selectedState, setSelectedState] = useState<string>(profile.domicileState || 'Telangana');
  const [selectedCategory, setSelectedCategory] = useState<string>('');
  const [searchKeyword, setSearchKeyword] = useState<string>('');
  const [includeUnlikely, setIncludeUnlikely] = useState<boolean>(true);
  const [savedSchemeIds, setSavedSchemeIds] = useState<string[]>(() =>
    defaultClaimTrackerService.getClaims().map((c) => c.schemeId)
  );

  const discoveryResult = defaultDiscoveryService.discover(
    { ...profile, domicileState: selectedState },
    {
      state: selectedState,
      category: selectedCategory || undefined,
      keyword: searchKeyword || undefined,
      includeUnlikely,
    }
  );

  const handleToggleSave = (schemeId: string) => {
    const item = discoveryResult.items.find((i) => i.scheme.id === schemeId);
    if (!item) return;

    if (savedSchemeIds.includes(schemeId)) {
      defaultClaimTrackerService.removeClaim(schemeId);
      setSavedSchemeIds((prev) => prev.filter((id) => id !== schemeId));
    } else {
      defaultClaimTrackerService.saveScheme(item.scheme);
      setSavedSchemeIds((prev) => [...prev, schemeId]);
    }
  };

  return (
    <div className="stack matches-page max-w-4xl mx-auto py-4 px-2">
      <div className="flex flex-col sm:flex-row sm:items-center justify-between border-b pb-3 gap-2">
        <div>
          <h1 className="text-2xl font-bold text-slate-900 flex items-center gap-2">
            <Search className="w-6 h-6 text-indigo-600" aria-hidden="true" />
            Matches
          </h1>
          <p className="text-sm text-slate-600 mt-1">
            Evaluating {discoveryResult.totalSchemesConsidered} public schemes with transparent rule-based logic.
          </p>
        </div>

        <Button variant="secondary" onClick={() => navigate('/intake')} className="text-xs">
          Edit Profile
        </Button>
      </div>

      {/* Coverage Disclosure Notice (FR-DATA-11) */}
      {discoveryResult.coverageNotice && (
        <div className="p-3 bg-amber-50 border border-amber-200 rounded text-xs text-amber-900 flex items-start gap-2">
          <Shield className="w-4 h-4 text-amber-600 flex-shrink-0 mt-0.5" />
          <div>
            <strong>Jurisdiction Data Disclosure:</strong> {discoveryResult.coverageNotice}
          </div>
        </div>
      )}

      {/* Filter and Search Bar */}
      <Card className="p-3 bg-white border-slate-200">
        <div className="grid grid-cols-1 sm:grid-cols-3 gap-3 text-xs">
          <div>
            <label className="font-semibold text-slate-700 block mb-1">State / Jurisdiction:</label>
            <select
              value={selectedState}
              onChange={(e) => setSelectedState(e.target.value)}
              className="w-full p-2 border border-slate-300 rounded bg-slate-50"
            >
              {NATIONAL_STATE_COVERAGE.map((st) => (
                <option key={st.stateCode} value={st.stateName}>
                  {st.stateName} ({st.coverageStatus === 'covered' ? 'Verified' : 'Partial / Pending'})
                </option>
              ))}
            </select>
          </div>

          <div>
            <label className="font-semibold text-slate-700 block mb-1">Category:</label>
            <select
              value={selectedCategory}
              onChange={(e) => setSelectedCategory(e.target.value)}
              className="w-full p-2 border border-slate-300 rounded bg-slate-50"
            >
              <option value="">All Categories</option>
              <option value="scholarship">Scholarships & Education Aid</option>
              <option value="fellowship">Fellowships & Higher Studies</option>
              <option value="welfare">Welfare Support</option>
            </select>
          </div>

          <div>
            <label className="font-semibold text-slate-700 block mb-1">Search Keywords:</label>
            <div className="relative">
              <input
                type="text"
                value={searchKeyword}
                onChange={(e) => setSearchKeyword(e.target.value)}
                placeholder="Search scheme name, portal..."
                className="w-full p-2 border border-slate-300 rounded pl-7"
              />
              <Search className="w-3.5 h-3.5 text-slate-400 absolute left-2 top-2.5" />
            </div>
          </div>
        </div>

        <div className="mt-2.5 pt-2 border-t flex items-center justify-between text-xs text-slate-500">
          <label className="flex items-center gap-1.5 cursor-pointer">
            <input
              type="checkbox"
              checked={includeUnlikely}
              onChange={(e) => setIncludeUnlikely(e.target.checked)}
              className="rounded text-indigo-600"
            />
            <span>Show Unlikely schemes (useful to see why criteria failed)</span>
          </label>

          <span>Showing {discoveryResult.items.length} candidate schemes</span>
        </div>
      </Card>

      {/* Discovered Schemes List */}
      <div className="flex flex-col gap-4">
        {discoveryResult.items.length === 0 ? (
          <div className="p-8 text-center bg-white rounded border text-slate-500 text-sm">
            <Filter className="w-8 h-8 text-slate-400 mx-auto mb-2" />
            <p className="font-semibold">No schemes found matching this filter.</p>
            <p className="text-xs text-slate-400 mt-1">Try clearing the search keyword or selecting a different category.</p>
          </div>
        ) : (
          discoveryResult.items.map(({ scheme, eligibility, nearMatch }) => {
            const isSaved = savedSchemeIds.includes(scheme.id);
            return (
              <Card
                key={scheme.id}
                className={`p-4 bg-white border transition-all hover:shadow-sm ${
                  eligibility.overallLabel === 'Likely eligible'
                    ? 'border-emerald-200'
                    : eligibility.overallLabel === 'Need to confirm'
                    ? 'border-amber-200'
                    : 'border-slate-200'
                }`}
              >
                <div className="flex flex-col gap-3">
                  {/* Top Bar: Jurisdiction & Status Chip */}
                  <div className="flex items-start justify-between gap-2">
                    <div>
                      <div className="flex items-center gap-2 mb-1">
                        <span className="text-[10px] font-bold uppercase tracking-wider px-2 py-0.5 rounded bg-slate-100 text-slate-700">
                          {scheme.jurisdiction === 'central' ? 'Central (All India)' : `${scheme.state} State`}
                        </span>
                        <span className="text-[11px] text-slate-400">
                          Version: {scheme.version} • Verified {scheme.lastVerifiedDate}
                        </span>
                      </div>
                      <h2 className="text-base font-bold text-slate-900 leading-snug">
                        <Link to={`/scheme/${scheme.id}`} className="hover:text-indigo-600">
                          {scheme.name}
                        </Link>
                      </h2>
                    </div>

                    <div className="flex-shrink-0">
                      <StatusChip status={eligibility.overallLabel} />
                    </div>
                  </div>

                  <p className="text-xs text-slate-600 line-clamp-2">{scheme.shortDescription}</p>

                  {/* Near Match Insight Banner if 1-condition miss */}
                  {nearMatch.isNearMatch && (
                    <div className="p-2.5 rounded bg-indigo-50/70 border border-indigo-200 text-xs text-indigo-950 flex items-start gap-2">
                      <Sparkles className="w-4 h-4 text-indigo-600 flex-shrink-0 mt-0.5" />
                      <div>
                        <strong>Near-Match Discovery:</strong> {nearMatch.advice}
                      </div>
                    </div>
                  )}

                  {/* Summary of Evaluation */}
                  <div className="p-2.5 bg-slate-50 rounded border border-slate-100 text-xs flex flex-col gap-1">
                    <p className="text-slate-800 font-medium">{eligibility.summaryExplanation}</p>
                    <div className="flex flex-wrap gap-2 text-[11px] text-slate-500 mt-1">
                      <span>Conditions satisfied: <strong>{eligibility.predicateTraces.filter((t) => t.result === 'true').length} / {eligibility.predicateTraces.length}</strong></span>
                      {eligibility.missingAttributes.length > 0 && (
                        <span className="text-amber-700">
                          • Needs confirmation: {eligibility.missingAttributes.join(', ')}
                        </span>
                      )}
                      {eligibility.failedAttributes.length > 0 && (
                        <span className="text-rose-700">
                          • Unmet: {eligibility.failedAttributes.join(', ')}
                        </span>
                      )}
                    </div>
                  </div>

                  {/* Footer Action Bar */}
                  <div className="flex flex-col sm:flex-row sm:items-center justify-between pt-2 border-t border-slate-100 gap-2">
                    <div className="flex items-center gap-3 text-xs">
                      <span className="font-semibold text-emerald-700 flex items-center gap-1">
                        <CheckCircle2 className="w-3.5 h-3.5" />
                        {scheme.feeStatus === 'free_verified' ? '100% Free Official Application' : scheme.feeDetails}
                      </span>
                      <a
                        href={scheme.sources[0]?.portalUrl}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="text-slate-500 hover:text-slate-800 inline-flex items-center gap-1"
                      >
                        Official Portal <ExternalLink className="w-3 h-3" />
                      </a>
                    </div>

                    <div className="flex items-center gap-2">
                      <button
                        type="button"
                        onClick={() => handleToggleSave(scheme.id)}
                        className={`text-xs px-3 py-1.5 rounded border flex items-center gap-1.5 transition-colors ${
                          isSaved
                            ? 'bg-emerald-50 text-emerald-800 border-emerald-300 font-semibold'
                            : 'bg-white text-slate-700 border-slate-300 hover:bg-slate-50'
                        }`}
                      >
                        {isSaved ? <BookmarkCheck className="w-3.5 h-3.5" /> : <Bookmark className="w-3.5 h-3.5" />}
                        {isSaved ? 'Saved in Tracker' : 'Save'}
                      </button>

                      <Link
                        to={`/scheme/${scheme.id}`}
                        className="text-xs px-3 py-1.5 rounded bg-indigo-600 hover:bg-indigo-700 text-white font-medium inline-flex items-center gap-1 transition-colors"
                      >
                        <span>View Action Graph</span>
                        <ArrowRight className="w-3.5 h-3.5" />
                      </Link>
                    </div>
                  </div>
                </div>
              </Card>
            );
          })
        )}
      </div>
    </div>
  );
}
