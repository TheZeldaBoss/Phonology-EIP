using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using App1.Models;

namespace App1.Services
{
    public class SoundMenuDataStore : IDataStore<Item>
    {
        List<Item> discoveryModulesItems;
        public SoundMenuDataStore()
        {
            discoveryModulesItems = new List<Item>();
            var mockItems = new List<Item>
            {
                new Item { Id = Guid.NewGuid().ToString(), Text = "Planète", Description = "" },
            };

            foreach (var item in mockItems)
            {
                discoveryModulesItems.Add(item);
            }

        }

        public async Task<bool> AddItemAsync(Item item)
        {
            discoveryModulesItems.Add(item);

            return await Task.FromResult(true);
        }

        public async Task<bool> UpdateItemAsync(Item item)
        {
            var oldItem = discoveryModulesItems.Where((Item arg) => arg.Id == item.Id).FirstOrDefault();
            discoveryModulesItems.Remove(oldItem);
            discoveryModulesItems.Add(item);

            return await Task.FromResult(true);
        }

        public async Task<bool> DeleteItemAsync(string id)
        {
            var oldItem = discoveryModulesItems.Where((Item arg) => arg.Id == id).FirstOrDefault();
            discoveryModulesItems.Remove(oldItem);

            return await Task.FromResult(true);
        }

        public async Task<Item> GetItemAsync(string id)
        {
            return await Task.FromResult(discoveryModulesItems.FirstOrDefault(s => s.Id == id));
        }

        public async Task<IEnumerable<Item>> GetItemsAsync(bool forceRefresh = false)
        {
            return await Task.FromResult(discoveryModulesItems);
        }
        
    }
}