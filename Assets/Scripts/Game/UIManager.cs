using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class UIManager : MonoBehaviour
{
    public static UIManager Instance;

    void Start()
    {
        Instance = this;

        DontDestroyOnLoad(LevelText.gameObject.transform.parent.gameObject);
    }

    [SerializeField]
    Text LevelText;
    [SerializeField]
    Text InventoryText;
    [SerializeField]
    Text WinText;

    public void SetLevel(int level)
    {
        if (!LevelText)
            return;
        LevelText.text = "Current Level: " + level;
    }

    public void SetInventory(string[] items)
    {
        if (!InventoryText)
            return;

        InventoryText.text = "-- Held Items --\n";

        if(items.Length == 0)
        {
            InventoryText.text += "--";
            return;
        }
        else
        {
            for(int i = 0; i < items.Length; i++)
            {
                InventoryText.text += items[i];
            }
        }
    }

    public void ShowVictory()
    {
        if (!LevelText || !InventoryText || !WinText)
            return;

        LevelText.gameObject.SetActive(false);
        InventoryText.gameObject.SetActive(false);

        WinText.gameObject.SetActive(true);
    }
}
